resource "aws_ecs_cluster" "ecscluster" {
  name = "dev1-rmit-cc"

  setting {
    name  = "containerInsights" // adds cost so disabling for now
    value = "disabled"
  }

  tags = local.mytags
}

resource "aws_ecs_service" "ecsservice-frontend" {
  name            = "coronavoider-frontend"
  task_definition = aws_ecs_task_definition.taskdef-frontend.id
  cluster         = aws_ecs_cluster.ecscluster.id
  desired_count   = 1
  depends_on      = [aws_lb_listener.ecs-lb-listener]

  load_balancer {
    target_group_arn = aws_lb_target_group.lb-tg.arn
    container_name   = "coronavoider-frontend"
    container_port   = 80
  }
}

resource "aws_ecs_task_definition" "taskdef-frontend" {
  family                = "coronavoider-frontend"
  container_definitions = file("task-definitions/coronavoider-frontend.json")
}



