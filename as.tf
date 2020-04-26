resource "aws_launch_template" "launch-template" {
  name_prefix   = "dev1-rmit-cc"
  image_id      = var.ami-amazon-linux-2
  instance_type = "t2.micro"
  user_data     = filebase64("scripts/install_ecs_cluster.sh")

  iam_instance_profile {
    name = "dev1-rmit-cc"
  }

  vpc_security_group_ids = [aws_security_group.sg-main.id]
}


resource "aws_autoscaling_group" "ecs-autoscaling-group" {
  name                = "dev1-rmit-cc"
  max_size            = 3
  min_size            = 1
  desired_capacity    = 1
  vpc_zone_identifier = [lookup(var.subnet-id-map, "us-east-1a"), lookup(var.subnet-id-map, "us-east-1b")]

  target_group_arns = [aws_lb_target_group.lb-tg.arn]

  launch_template {
    id      = aws_launch_template.launch-template.id
    version = "$Latest"
  }
}




variable "ecs-launch-config-name" {
  default = "dev1-rmit-cc"
}
