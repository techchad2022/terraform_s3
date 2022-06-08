# //////////////////////////////////
# BUCKET RESOURCE
# //////////////////////////////////
resource "aws_s3_bucket" "tc2022_bucket" {
  bucket = var.bucket_name
  acl = var.acl_name
}