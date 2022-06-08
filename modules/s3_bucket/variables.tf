# //////////////////////////////////
# VARIABLES TF
# //////////////////////////////////

# Provider
variable "profile" {
    type = string 
}
variable "region" {
  type = string
}
variable "region1" {
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
  default = false
}

# aws_iam_role
variable "iam_role_name" {
  type = string
  default = "tf-iam-role-replication"
}


# aws_iam_policy
variable "aws_iam_policy_name" {
  default = "tf-iam-role-policy-replication"
  type = string
}



# replication_configuration
variable "replica_storage_class" {
  default = "STANDARD"
}

variable "replica_time_status" {
  default = "Enabled"
}

variable "replication_and_metrics_time" {
  default = 15
  type = number
}


# json variables
# variable "source_arn" {
#   default = data.aws_s3_bucket.main_bucket.arn.rendered
# }

# variable "replica_arn" {
#   default = data.aws_s3_bucket.replica.arn.rendered
# }
