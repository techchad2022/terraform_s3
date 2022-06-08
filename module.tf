module "s3_bucket" {
  source = "./modules/s3_bucket"
  profile = var.profile
  region = var.region
  bucket_name = var.bucket_name
  acl_name = var.acl_name
  tags = var.tags
  versioning = var.versioning
}