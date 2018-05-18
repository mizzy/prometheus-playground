/*
resource "aws_elb" "elb0" {
  name = "elb0"
  
  listener {
    instance_port = 9090
    instance_protocol = "http"
    lb_port = 9090
    lb_protocol = "http"
  }

  instances = ["${aws_instance.prometheus-001.id}"]

  availability_zones = ["ap-northeast-1a"]
}

resource "aws_elb" "elb1" {
  name = "elb1"
  
  listener {
    instance_port = 9090
    instance_protocol = "http"
    lb_port = 9090
    lb_protocol = "http"
  }

  instances = ["${aws_instance.prometheus-001.id}"]

  availability_zones = ["ap-northeast-1a"]
}
*/
