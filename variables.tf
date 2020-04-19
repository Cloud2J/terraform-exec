locals {
  mytags = {
    "Owner"       = "Cloud2J",
    "Terraform"   = "true",
    "Application" = "Cloud Computing A2"
  }

}

variable "vpc-main" {
  default = "vpc-fccdcd86"
}

variable "subnet-id-map" {
  default = {
    "us-east-1a" = "subnet-7014e016"
    "us-east-1b" = "subnet-91fa08b0"
    "us-east-1c" = "subnet-3ee56273"
    "us-east-1d" = "subnet-64a3533b"
    "us-east-1e" = "subnet-44447f7a"
    "us-east-1f" = "subnet-5704aa59"
  }
}


variable "ami-amazon-linux-2" {
  default = "ami-0323c3dd2da7fb37d"
}
