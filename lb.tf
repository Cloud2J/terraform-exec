resource "aws_lb" "ecs-lb" {
  name               = var.ecs-lb-name
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

resource "aws_lb_listener" "ecs-lb-listener" {
  load_balancer_arn = aws_lb.ecs-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-tg.arn
  }
}


resource "aws_lb_target_group" "lb-tg" {
  name     = var.ecs-lb-tg-name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-main
}

# resource "aws_lb_target_group_attachment" "lb-tg-1" {
#   target_group_arn = aws_lb_target_group.lb-tg.arn
#   target_id = 
# }



variable "ecs-lb-name" {
  default = "dev1-rmit-cc"
}

variable "ecs-lb-tg-name" {
  default = "dev1-rmit-cc"
}

