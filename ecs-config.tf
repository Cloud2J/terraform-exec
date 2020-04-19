resource "aws_launch_configuration" "ecs-launch-config" {
  name          = var.ecs-launch-config-name
  image_id      = var.ami-amazon-linux-2
  instance_type = "t2.micro"


}

resource "aws_autoscaling_group" "ecs-autoscaling-group" {
  name                 = "dev1-rmit-cc"
  max_size             = 1
  min_size             = 1
  desired_capacity     = 1
  vpc_zone_identifier  = [lookup(var.subnet-id-map, "us-east-1a"), lookup(var.subnet-id-map, "us-east-1b")]
  launch_configuration = aws_launch_configuration.ecs-launch-config.name
  health_check_type    = "ELB"

}




variable "ecs-launch-config-name" {
  default = "dev1-rmit-cc"
}
