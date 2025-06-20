include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/organization-account"
}

inputs = {
    name = "test-account"
    email = get_env("TEST_ACCOUNT_EMAIL") # As this repo is public, this is to protect the email address.
}