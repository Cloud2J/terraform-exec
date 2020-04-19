resource "aws_cloudwatch_log_group" "log-group" {
  name = "dev1-rmit-cc"

  tags = local.mytags
}
