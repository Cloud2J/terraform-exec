resource "aws_lb" "ecs-lb" {
  name               = "dev1-rmit-cc"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-main.id]
  subnets = [lookup(var.subnet-id-map, "us-east-1a"),
  lookup(var.subnet-id-map, "us-east-1b")]

  enable_deletion_protection = false

  # access_logs { # needs additional IAM role.... Failure configuring LB attributes: InvalidConfigurationRequest: Access Denied for bucket: dev1-rmit-cc. Please check S3bucket permission
  #   bucket  = aws_s3_bucket.bucket.id
  #   prefix  = "${var.ecs-lb-name}_"
  #   enabled = true
  # }

  tags = local.mytags
}

resource "aws_lb_listener" "ecs-lb-listener-frontend" {
  load_balancer_arn = aws_lb.ecs-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-tg-frontend.arn
  }
}

resource "aws_lb_target_group" "lb-tg-frontend" {
  name     = "target-group-frontend"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-main
}

# resource "aws_lb_listener" "ecs-lb-listener-backend" {
#   load_balancer_arn = aws_lb.ecs-lb.arn
#   port              = 8080
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.lb-tg-backend.arn
#   }
# }

# resource "aws_lb_target_group" "lb-tg-backend" {
#   name     = "target-group-backend"
#   port     = 8080
#   protocol = "HTTP"
#   vpc_id   = var.vpc-main
# }

