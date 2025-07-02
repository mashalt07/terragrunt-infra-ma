output "bucket_id" {
    description = "The id of the bucket."
    value = {
        for k, v in aws_s3_bucket.this : k => v.id
    }
}