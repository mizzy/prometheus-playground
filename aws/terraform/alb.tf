/*
resource "aws_lb" "alb0" {
  name = "alb0"
  subnets = ["subnet-b4d130dc", "subnet-4d542565"]
}

resource "aws_lb" "alb1" {
  name = "alb1"
  subnets = ["subnet-b4d130dc", "subnet-4d542565"]
}

resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-b3d130db"
}
*/
