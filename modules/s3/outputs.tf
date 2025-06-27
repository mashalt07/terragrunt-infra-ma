output "bucket_id" {
    description = "The id of the bucket"
    value = aws_s3_bucket.this[*].id
}