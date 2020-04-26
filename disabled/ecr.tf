resource "aws_ecr_repository" "ecrrepo" {
  name                 = var.ecr-repo-name
  image_tag_mutability = "MUTABLE"


  image_scanning_configuration {
    scan_on_push = true
  }
    tags = local.mytags

}

variable "ecr-repo-name" {
  default = "dev1-rmit-cc"
}
