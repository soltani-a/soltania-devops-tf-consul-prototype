resource "aws_security_group" "sg_host_container" {
  name        = "sg_host_container"
  description = "SG for consul"
}

resource "aws_vpc_security_group_ingress_rule" "sg_ingress_rule_80_alb" {
  security_group_id = aws_security_group.sg_host_container.id

  #referenced_security_group_id = aws_security_group.sg_alb.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = var.alb_port_ingress
  to_port     = var.alb_port_ingress
}

resource "aws_vpc_security_group_egress_rule" "sg_egress_rule_80_alb" {
  security_group_id = aws_security_group.sg_host_container.id

  #referenced_security_group_id = aws_security_group.sg_consul.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = var.container_port_ingress
  to_port     = var.container_port_ingress
}