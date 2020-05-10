locals {
  mytags = {
    "Owner"       = "Cloud2J",
    "Terraform"   = "true",
    "Application" = "Cloud Computing A2"
  }

}

variable "vpc-main" {
  default = "vpc-576b7c2d" # << aws educate account vpc
  #"vpc-fccdcd86" << my personal vpc
}

variable "subnet-id-map" {
  default = {
    "us-east-1a" = "subnet-e436f2bb" #"subnet-7014e016" << personal account subnet
    "us-east-1b" = "subnet-35887353" #"subnet-91fa08b0"
    "us-east-1c" = "subnet-246fa905" #"subnet-3ee56273"
    "us-east-1d" = "subnet-f775feba" #"subnet-64a3533b"
    "us-east-1e" = "subnet-91bfb0af" #"subnet-44447f7a"
    "us-east-1f" = "subnet-366dd038" #"subnet-5704aa59"
  }
}


variable "ami-amazon-linux-2" {
  # default = "ami-0323c3dd2da7fb37d"
  default = "ami-09edd32d9b0990d49" // ECS optimised
}
