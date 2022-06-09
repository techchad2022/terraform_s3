output "main_bucket_id" {
  value = aws_s3_bucket.tc2022_s3_bucket.id
}

output "main_arn" {
    value = aws_s3_bucket.tc2022_s3_bucket.arn
}

output "main_bucket" {
    value = aws_s3_bucket.tc2022_s3_bucket.bucket
}

output "main_bucket_domain_name" {
  value = aws_s3_bucket.tc2022_s3_bucket.bucket_domain_name
}

output "rep_bucket_id" {
  value = aws_s3_bucket.replica.id
}

output "rep_arn" {
    value = aws_s3_bucket.replica.arn
}

output "rep_bucket" {
    value = aws_s3_bucket.replica.bucket
}

output "rep_bucket_domain_name" {
  value = aws_s3_bucket.replica.bucket_domain_name
}