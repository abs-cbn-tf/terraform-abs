resource "aws_network_acl" "nacl" {
  vpc_id = var.vpc_id

  dynamic "subnet" {
    for_each = var.subnets
    content {
      subnet_id = subnet.value
    }
  }

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      rule_number  = ingress.value.rule_number
      protocol     = ingress.value.protocol
      action       = ingress.value.action
      cidr_block   = ingress.value.cidr_block
      from_port    = ingress.value.from_port
      to_port      = ingress.value.to_port
      icmp_code    = ingress.value.icmp_code
      icmp_type    = ingress.value.icmp_type
              }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      rule_number  = egress.value.rule_number
      protocol     = egress.value.protocol
      action       = egress.value.action
      cidr_block   = egress.value.cidr_block
      from_port    = egress.value.from_port
      to_port      = egress.value.to_port
      icmp_code    = egress.value.icmp_code
      icmp_type    = egress.value.icmp_type
    }
  }
}

output "nacl_id" {
  value = aws_network_acl.nacl.id
}

