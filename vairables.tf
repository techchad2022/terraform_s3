# //////////////////////////////////
# VARIABLES TF
# //////////////////////////////////
variable "profile" {
    type = string 
}
variable "region" {
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