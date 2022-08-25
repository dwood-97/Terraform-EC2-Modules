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
  source         = "./ec2"
  ami            = "ami-830c94e3"
  instance_type  = "t2.micro"
  security_group = module.security_group.app_server
  tag_name       = "ExampleAppServerInstance"
}

module "security-group" {
  source      = "./security-group"
  name        = "Allow all security group"
  description = "Allow all inbound HTTP traffic"
  vpc_id      = "vpc-07f0265dfc46a3de5"
  ingress {
    from_port_in = 80
    to_port_in   = 80
    protocol_in  = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }
  egress {
    from_port_eg   = 0
    to_port_eg     = 0
    protocol_eg    = "-1"
    cidr_blocks_eg = ["0.0.0.0/0"]
  }
}

