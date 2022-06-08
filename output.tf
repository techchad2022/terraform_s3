output "bucket_id" {
  value = aws_s3_bucket.tc2022_s3.id
}

output "arn" {
    value = aws_s3_bucket.tc2022_s3.arn
}

output "bucket" {
    value = aws_s3_bucket.tc2022_s3.bucket
}

output "bucket_domain_name" {
  value = aws_s3_bucket.tc2022_s3.bucket_domain_name
}