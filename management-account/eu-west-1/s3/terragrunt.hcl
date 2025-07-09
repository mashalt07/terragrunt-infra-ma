include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/s3"
}

inputs = {
    bucket_name = ["test-bucket-main-mo-altamash"]
    tag_name = "test-bucket-main-ma"
}