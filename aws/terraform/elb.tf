resource "aws_elb" "elb" {
  listener {
    instance_port = 9090
    instance_protocol = "http"
    lb_port = 9090
    lb_protocol = "http"
  }

  instances = ["${aws_instance.prometheus-001.id}"]

  availability_zones = ["ap-northeast-1a"]
}

resource "aws_elb" "elb2" {
  listener {
    instance_port = 9090
    instance_protocol = "http"
    lb_port = 9090
    lb_protocol = "http"
  }

  instances = ["${aws_instance.prometheus-001.id}"]

  availability_zones = ["ap-northeast-1a"]
}

