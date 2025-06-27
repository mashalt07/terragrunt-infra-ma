include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/s3"
}

inputs = {
    bucket_name = ["ma-bucket-one-altamash", "ma-bucket-two-altamash"]
    tag_name = "ma-test-bucket-tag"
}