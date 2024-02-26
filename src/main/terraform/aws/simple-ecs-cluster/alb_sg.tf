resource "aws_security_group" "sg_alb" {
  name        = "sg_alb"
  description = "SG for consul"
}

resource "aws_vpc_security_group_ingress_rule" "sg_alb_ingress_rule_80" {
  security_group_id = aws_security_group.sg_alb.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = var.alb_port_ingress
  to_port     = var.alb_port_ingress
}

resource "aws_vpc_security_group_egress_rule" "sg_alb_egress_rule_80" {
  security_group_id = aws_security_group.sg_alb.id

  #referenced_security_group_id = aws_security_group.sg_host_container.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = var.host_port_ingress
  to_port     = var.host_port_ingress
}