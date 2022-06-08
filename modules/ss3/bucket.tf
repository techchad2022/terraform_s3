# //////////////////////////////////
# BUCKET RESOURCE
# //////////////////////////////////
resource "aws_s3_bucket" "tc2022_ss3_bucket" {
  bucket = "${var.bucket_name}-s3"
  acl = var.acl_name
}