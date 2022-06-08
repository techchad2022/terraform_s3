# //////////////////////////////////
# BUCKET RESOURCE
# //////////////////////////////////
resource "aws_s3_bucket" "tc2022_s3_bucket" {
  bucket = var.bucket_name
  acl = var.acl_name
  tags = var.tags
  versioning {
    enabled = var.versioning
  }
}