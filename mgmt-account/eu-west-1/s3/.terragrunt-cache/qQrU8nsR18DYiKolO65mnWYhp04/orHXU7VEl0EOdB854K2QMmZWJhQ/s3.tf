resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = {
    Name        = var.tag_name
    Environment = var.enviroment
  }
}