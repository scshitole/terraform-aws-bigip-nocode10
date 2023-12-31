resource "aws_iam_role" "scsrole" {
  name = "${var.prefix}-scs-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "scsprofile" {
  name = "${var.prefix}-scs"
  role = aws_iam_role.scsrole.name
}
