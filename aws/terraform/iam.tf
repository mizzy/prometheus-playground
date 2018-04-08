resource "aws_iam_instance_profile" "prometheus" {
  name  = "prometheus"
  role = "${aws_iam_role.prometheus.name}"
}

resource "aws_iam_role" "prometheus" {
    name = "prometheus_role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "cloudwatch_read_only" {
    name = "cloudwatch_read_only"
    role = "${aws_iam_role.prometheus.id}"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "autoscaling:Describe*",
                "ec2:DescribeInstances",
                "ec2:DescribeTags",
                "cloudwatch:Describe*",
                "cloudwatch:Get*",
                "cloudwatch:List*",
                "logs:Get*",
                "logs:List*",
                "logs:Describe*",
                "logs:TestMetricFilter",
                "sns:Get*",
                "sns:List*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
EOF
}
