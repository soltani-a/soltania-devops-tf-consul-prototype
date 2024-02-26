resource "aws_security_group" "sg_consul" {
  name        = "sg_consul"
  description = "SG for consul"
}

resource "aws_vpc_security_group_ingress_rule" "security_group_ingress_8500" {
  security_group_id = aws_security_group.sg_consul.id

  #referenced_security_group_id = aws_security_group.sg_host_container.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = var.container_port_ingress
  to_port     = var.container_port_ingress
}

resource "aws_vpc_security_group_egress_rule" "security_group_egress_8500" {
  security_group_id = aws_security_group.sg_consul.id

  #referenced_security_group_id = aws_security_group.sg_host_container.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = var.container_port_ingress
  to_port     = var.container_port_ingress
}