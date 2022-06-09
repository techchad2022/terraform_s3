# //////////////////////////////////
# BUCKET RESOURCE
# //////////////////////////////////
resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

# AWS IAM Role
resource "aws_iam_role" "replication" {
  name = var.iam_role_name
  assume_role_policy = data.template_file.aws_iam_role_policy.rendered
}
# AWS IAM Policy
resource "aws_iam_policy" "replication" {
  name = var.aws_iam_policy_name 
  policy = data.template_file.aws_iam_policy_json.rendered
}
# Attaching Roles and Policy
resource "aws_iam_role_policy_attachment" "replication" {
  role = aws_iam_role.replication.name
  policy_arn =  aws_iam_policy.replication.arn
}

# Replica Bucket
resource "aws_s3_bucket" "replica" {
  bucket = "${var.bucket_name}-${var.region1}"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  grant {
    id          = data.aws_canonical_user_id.current_user.id
    type        = "CanonicalUser"
    permissions = ["FULL_CONTROL"]
  }

  grant {
    type        = "Group"
    permissions = ["READ_ACP", "WRITE"]
    uri         = "http://acs.amazonaws.com/groups/s3/LogDelivery"
  }

  versioning {
    enabled = true
  }
}
# Main Bucket
resource "aws_s3_bucket" "tc2022_s3_bucket" {
  bucket = "${var.bucket_name}-${var.region}"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  provider = aws.default
  grant {
    id          = data.aws_canonical_user_id.current_user.id
    type        = "CanonicalUser"
    permissions = ["FULL_CONTROL"]
  }

  grant {
    type        = "Group"
    permissions = ["READ_ACP", "WRITE"]
    uri         = "http://acs.amazonaws.com/groups/s3/LogDelivery"
  }

  tags = var.tags
  versioning {
    enabled = var.versioning
  }
 
  replication_configuration {
    role = aws_iam_role.replication.arn
    rules {
      id = "replica"
      status = "Enabled"
      filter {
        tags = {}
      }
      destination {
        bucket = aws_s3_bucket.replica.arn
        storage_class = var.replica_storage_class
        
      }
    }

  }

}