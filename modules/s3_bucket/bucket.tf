# //////////////////////////////////
# BUCKET RESOURCE
# //////////////////////////////////



resource "aws_iam_role" "replication" {
  name = var.iam_role_name
  assume_role_policy = data.template_file.aws_iam_role_policy.rendered
}

resource "aws_iam_policy" "replication" {
  name = var.aws_iam_policy_name 
  policy = data.template_file.aws_iam_policy_json.rendered
}

resource "aws_iam_role_policy_attachment" "replication" {
  role = aws_iam_role.replication.name
  policy_arn =  aws_iam_policy.replication.arn
}


resource "aws_s3_bucket" "replica" {
  bucket = "${var.bucket_name}-${var.region1}"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "tc2022_s3_bucket" {
  bucket = "${var.bucket_name}-${var.region}"
  provider = aws.default
  acl = var.acl_name
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