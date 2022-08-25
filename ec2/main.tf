# -- ec2/main.tf -- #
resource "aws_instance" "app_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_groups
  tags = {
    Name = var.tag_name
  }
}
