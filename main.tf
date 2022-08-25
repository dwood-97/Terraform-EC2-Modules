# -- root/main.tf -- #
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "us-west-2"
}

module "ec2" {
  source         = "./resources/ec2"
  ami            = "ami-830c94e3"
  instance_type  = "t2.micro"
  security_group = module.security-group.app_server_security_group
  tag_name       = "ExampleAppServerInstance"
}

module "security-group" {
  source = "./resources/security-group"
}
