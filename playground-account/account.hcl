# Set account-wide variables. These are automatically pulled in to configure the remote state bucket in the root.hcl configuration.
locals {
  aws_account_id = get_env("PG_AWS_ACCOUNT_ID")
}