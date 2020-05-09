# terraform-exec

## Requirements

Terraform v0.12.xx
AWS CLI (preferably v2)


## Quick start

```bash
terraform init          # initialise terraform project
terraform plan          # plan out cloud resources
terraform apply         # create cloud resources
terraform destroy       # destroy cloud resources
```

Note: keep track of **terraform.tfstate** and **terraform.tfstate.backup** files. Don't change contents as this contains the data of previous terraform command. 


```bash
terraform fmt           # formatter
```