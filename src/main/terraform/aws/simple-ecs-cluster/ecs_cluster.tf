resource "aws_ecs_cluster" "ecs_cluster_for_consul_cluster" {
  name = "ecs_cluster_for_consul"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "ecs_cluster_capacity_providers_fargate_spot" {
  cluster_name = aws_ecs_cluster.ecs_cluster_for_consul_cluster.name

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}