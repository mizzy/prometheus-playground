resource "aws_instance" "prometheus-001" {
  ami = "ami-0d74386b"
  instance_type = "t2.medium"
  key_name = "aws_mizzy"
  security_groups = ["all"]
  iam_instance_profile = "${aws_iam_instance_profile.prometheus.name}"

  tags {
    Name = "prometheus-001"
  }

  root_block_device {
    volume_size = "100"
  }
}
