resource "aws_ecs_service" "ecs_service_consul" {
  # Environment
  cluster          = aws_ecs_cluster.ecs_cluster_for_consul_cluster.id
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  enable_ecs_managed_tags            = true
  enable_execute_command             = false
  force_new_deployment               = null
  health_check_grace_period_seconds  = 0

  # Deployment configuration
  task_definition = aws_ecs_task_definition.ecs_task_definition_consul.arn
  # Deployment configuration - Service
  name                = "consul-service"
  scheduling_strategy = "REPLICA"

  # Deployment configuration - Task
  # Not available  

  network_configuration {
    subnets          = data.aws_subnets.subnets_eu_west_1.ids
    assign_public_ip = true
    security_groups = [
      aws_security_group.sg_host_container.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.front_end.arn
    container_name   = "consul-server"
    container_port   = var.host_port_ingress
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  deployment_controller {
    type = "ECS"
  }
}