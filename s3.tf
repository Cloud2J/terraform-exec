resource "aws_s3_bucket" "bucket" {
  bucket = var.bucketname
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = local.mytags


}


variable "bucketname" {
  default = "dev1-rmit-cc"
}

