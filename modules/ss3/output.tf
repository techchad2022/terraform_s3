output "bucket_id" {
  value = aws_s3_bucket.tc2022_s3_bucket.id
}

output "arn" {
    value = aws_s3_bucket.tc2022_s3_bucket.arn
}

output "bucket" {
    value = aws_s3_bucket.tc2022_s3_bucket.bucket
}

output "bucket_domain_name" {
  value = aws_s3_bucket.tc2022_s3_bucket.bucket_domain_name
}