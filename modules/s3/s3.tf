resource "aws_s3_bucket" "this" {
  for_each = var.bucket_name
  bucket = each.key

  tags = {
    Name        = var.tag_name
    Environment = var.environment
  }
}