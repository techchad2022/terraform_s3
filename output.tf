output "bucket_id" {
  value = module.s3_bucket.main_bucket_id
}

output "arn" {
    value = module.s3_bucket.main_arn
}

output "bucket" {
    value = module.s3_bucket.main_bucket
}

output "bucket_domain_name" {
  value = module.s3_bucket.main_bucket_domain_name
}

output "rep_bucket_id" {
  value = module.s3_bucket.rep_bucket_id
}

output "rep_arn" {
    value = module.s3_bucket.rep_arn
}

output "rep_bucket" {
    value = module.s3_bucket.rep_bucket
}

output "rep_bucket_domain_name" {
  value = module.s3_bucket.rep_bucket_domain_name
}