resource "aws_ecs_task_definition" "ecs_task_definition_consul" {
  family                   = "consul-service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 512
  memory                   = 1024
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }
  container_definitions = jsonencode([
    {
      name      = "consul-server"
      image     = var.container_image
      cpu       = 512
      memory    = 1024
      essential = true
      portMappings = [
        {
          containerPort = var.container_port_ingress
          hostPort      = var.host_port_ingress
        }
      ]
    }
  ])
}
