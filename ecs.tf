resource "aws_ecs_cluster" "ecscluster" {
  name = var.ecs-cluster-name

  setting {
    name  = "containerInsights" // adds cost so disabling for now
    value = "disabled"
  }

  tags = local.mytags
}

resource "aws_ecs_service" "ecsservice" {
  name            = var.ecs-service-name
  task_definition = aws_ecs_task_definition.taskdef.id #id or arn?
  cluster         = aws_ecs_cluster.ecscluster.id
  desired_count   = 1
  # depends_on = [aws_lb_listener.ecs-lb-listener]

  load_balancer {
    target_group_arn = aws_lb_target_group.lb-tg.arn
    container_name   = "coronavoider"
    container_port   = 80
  }
}


resource "aws_ecs_task_definition" "taskdef" {
  family                = var.ecs-task-def-name
  container_definitions = file("task-definitions/service.json")
}



variable "ecs-cluster-name" {
  default = "dev1-rmit-cc"
}

variable "ecs-service-name" {
  default = "dev1-rmit-cc"
}

variable "ecs-task-def-name" {
  default = "dev1-rmit-cc"
}

