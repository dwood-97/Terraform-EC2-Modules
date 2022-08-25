# -- security/outputs.tf -- #

output "webserver_sg" {
  value = aws_security_group.app_server.id
}
