# -- security/outputs.tf -- #

output "app_server_security_group" {
  value = aws_security_group.app_server.id
}
