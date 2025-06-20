# ROOT TERRAGRUNT CONFIGURATION

locals {
  # Automatically load account-level variables
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  # Automatically load region-level variables
  region_vars = try(
  read_terragrunt_config(find_in_parent_folders("region.hcl")),
  { locals = { aws_region = "eu-west-2" } }  # region fallback for global aws services without a region.hcl file present.
  )

  # Extract the variables we need for easy access
  account_id   = local.account_vars.locals.aws_account_id
  is_management_account = try(local.account_vars.locals.is_management_account, false) # checks if the is_management_account is set in account.hcl to true for the management account, otherwise fallsback to false for member accounts.
  aws_region   = local.region_vars.locals.aws_region
  
  provider_management = <<EOF
provider "aws" {
  region = "${local.aws_region}"

  # Only these AWS Account IDs may be operated on by this template
  allowed_account_ids = ["${local.account_id}"]
}
EOF

provider_non_management = <<EOF
provider "aws" {
  region = "${local.aws_region}"

  assume_role {
    role_arn = "arn:aws:iam::${local.account_id}:role/${local.role_name}"
  }
  # Only these AWS Account IDs may be operated on by this template
  allowed_account_ids = ["${local.account_id}"]
}
EOF


  # State bucket region will remain the same. 
  state_aws_region = "eu-west-2"

  # Role name to be used for multi-account deployment. Assumes use of AWS Organizations for multi-account setup.
  role_name = "OrganizationAccountAccessRole"
}

# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = local.is_management_account ? local.provider_management : local.provider_non_management
}

# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = get_env("TF_STATE_BUCKET")
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.state_aws_region
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
