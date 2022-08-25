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
  source          = "./module/ec2"
  ami             = "ami-0d70546e43a941d70"
  instance_type   = "t2.micro"
  security_groups = module.security.webserver_sg
  tag_name        = "ExampleAppServerInstance"
}

module "security-group" {
  source = "./module/security-group"
}
