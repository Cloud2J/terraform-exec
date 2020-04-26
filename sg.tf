resource "aws_security_group" "sg-main" {
  name        = "dev1-rmit-cc"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = var.vpc-main

  tags = local.mytags
}

resource "aws_security_group_rule" "sg-rule-inbound-http" {
  description       = "Allow inbound HTTP"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-main.id
}

resource "aws_security_group_rule" "sg-rule-inbound-ssh" {
  description       = "Allow inbound SSH"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-main.id
}

resource "aws_security_group_rule" "sg-rule-inbound-8080" {
  description       = "Allow inbound SSH"
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-main.id
}

resource "aws_security_group_rule" "sg-rule-outbound-all" {
  description       = "Allow outbound all"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-main.id
}


