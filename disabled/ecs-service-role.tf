# resource "aws_iam_role" "ecs-service-role" {
#   name = "ecs-service-role"
#   path = "/"
#   assume_role_policy = 
# }


# data "aws_iam_policy_document" "ecs-service-policy" {
#     statement {
#         actions = ["sts:AssumeRole"]

#         principals {
#             type = "Service"
#             identifiers = ["ecs.amazon.com"]
#         }
#     }
# }