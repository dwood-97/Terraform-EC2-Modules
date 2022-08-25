# -- security-group/variables -- #

variable "vpc_id" {
  type    = string
  default = "vpc-07f0265dfc46a3de5"
}
variable "name" {
  type    = string
  default = "allow_all_in_http"
}
variable "ingress_rules" {
  default = {
    "my ingress rule" = {
      "description" = "For HTTP"
      "from_port"   = "80"
      "to_port"     = "80"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    }
  }
  type        = map(any)
  description = "Security group rules"
}
variable "egress_rules" {
  default = {
    "my egress rule" = {
      "description" = "For HTTP"
      "from_port"   = "80"
      "to_port"     = "80"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    }
  }
  type        = map(any)
  description = "Security group rules"
}
