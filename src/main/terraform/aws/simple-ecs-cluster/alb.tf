resource "aws_lb" "front_end" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.sg_alb.id
  ]
  subnets = data.aws_subnets.subnets_eu_west_1.ids
}

resource "aws_lb_target_group" "front_end" {
  name        = "tf-example-lb-tg"
  port        = var.host_port_ingress
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.aws_vpc.vpc_defaults_eu_west_1.id
  health_check {
    enabled  = true
    protocol = "HTTP"
    path     = "/"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = var.host_port_ingress
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
}