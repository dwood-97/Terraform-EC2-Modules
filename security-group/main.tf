# -- security/main.tf -- #
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
  region = var.region
}
resource "aws_security_group" "app_server" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id
  ingress {
    from_port   = var.from_port_in
    to_port     = var.to_port_in
    protocol    = var.protocol_in
    cidr_blocks = [var.cidr_blocks_in]
  }
  egress {
    from_port   = var.from_port_eg
    to_port     = var.to_port_eg
    protocol    = var.protocol_eg
    cidr_blocks = [var.cidr_blocks_eg]
  }
}
