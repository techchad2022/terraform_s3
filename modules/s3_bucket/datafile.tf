data "template_file" "aws_iam_role_policy" {
    template = file("${path.root}/policy/aws_iam_role_policy.json")
}

data "template_file" "aws_iam_policy_json" {
    template = file("${path.root}/policy/aws_iam_policy.json")
    vars = {
        source_arn = "${aws_s3_bucket.tc2022_s3_bucket.arn}"
        destination_arn = "${aws_s3_bucket.replica.arn}"
    }

}
data "aws_canonical_user_id" "current_user" {}

