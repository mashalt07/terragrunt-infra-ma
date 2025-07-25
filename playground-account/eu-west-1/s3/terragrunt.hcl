include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/s3"
}

inputs = {
    bucket_name = ["test-bucket-one-mo-altamash", "test-bucket-two-mo-altamash"]
    tag_name = "test-bucket-tag-maltamash"
}