output "public_dns" {
  value = "${aws_instance.prometheus-001.public_dns}"
}
