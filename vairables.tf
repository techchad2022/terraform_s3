# //////////////////////////////////
# VARIABLES TF
# //////////////////////////////////
#  Regions
variable "region" {
  type = string
}
variable "region1" {
  type = string
}

# S3 bucket with redundancy
variable "profile" {
    type = string 
}
variable "bucket_name" {
  type = string
}
variable "acl_name" {
  type = string
}
variable "tags" {
  type = map(string)
}
variable "versioning" {
  type = bool
}