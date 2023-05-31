variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs to associate with the NACL"
  type        = list(string)
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type        = list(object({
    rule_number = number
    protocol    = string
    action      = string
    cidr_block  = string
    from_port   = number
    to_port     = number
    icmp_code   = number
    icmp_type   = number
  }))
}

variable "egress_rules" {
  description = "List of egress rules"
  type        = list(object({
    rule_number = number
    protocol    = string
    action      = string
    cidr_block  = string
    from_port   = number
    to_port     = number
    icmp_code   = number
    icmp_type   = number
  }))
}

