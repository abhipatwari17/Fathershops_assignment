# ELB
resource "aws_elb" "default" {
  name               = "my-elb"

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  # Add more listener blocks if needed

  subnets = aws_subnet.wp-public-tf[*].id
}



resource "aws_lb_cookie_stickiness_policy" "wp-elb-tf-policy" {
  name                     = "wp-elb-tf-policy"
  load_balancer            = aws_elb.default.id
  lb_port                  = 80
  cookie_expiration_period = 600
}
