variable "bucket_name" {
    description = "The name of the s3 buckets to create."
    type = set(string)
}

variable "tag_name" {
    description = "The name of the tag."
    default = "test"
}

variable "enviroment" {
    description = "The environment."
    default = "test-env"
}