include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  // This double-slash allows the module to leverage relative
  // paths to other modules in this repository.
  //
  // NOTE: When used in a different repository, you will need to
  // use a source URL that points to the relevant module in this repository.
  // e.g.
  // source = "git::git@github.com:acme/terragrunt-infrastructure-modules-example.git//modules/ecs-fargate-service"
  source = "../../../modules/s3"
}

inputs = {
    bucket_name = "ma-test-bucket-terragrunt"
    tag_name = "ma-test-bucket-tag"
}