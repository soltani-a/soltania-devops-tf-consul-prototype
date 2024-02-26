variable "environment" {
  type = string
}

variable "container_image" {
  type = string
}

variable "alb_port_ingress" {
  type = number
}

variable "host_port_ingress" {
  type = number
}

variable "container_port_ingress" {
  type = number
}