resource "aws_iam_instance_profile" "ecs-instance-profile" {
  name = "dev1-rmit-cc"
  role = aws_iam_role.iam-role.name
}


resource "aws_iam_role" "iam-role" {
  name = "ec2-to-ecs-iam-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}


resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.iam-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}
