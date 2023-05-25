provider "aws" {
  region = "us-west-2"
}

module "nacl" {
  source        = "./modules/nacl"
  vpc_id        = "vpc-123456789"
  subnets       = ["subnet-123456789", "subnet-987654321"]
  ingress_rules = [
    {
      rule_number = 100
      protocol    = "tcp"
      action      = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 80
      to_port     = 80
    },
    {
      rule_number = 200
      protocol    = "icmp"
      action      = "deny"
      cidr_block  = "10.0.0.0/16"
      icmp_code   = 0
      icmp_type   = 8
    }
  ]
  egress_rules = [
    {
      rule_number = 100
      protocol    = "-1"
      action      = "allow"
      cidr_block  = "0.0.0.0/0"
      from_port   = 0
      to_port     = 0
    }
  ]
}

# Example update
resource "aws_network_acl_rule" "nacl_rule" {
  network_acl_id = module.nacl.nacl_id
  rule_number    = 300
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.0.0/16"
  from_port      = 443
  to_port        = 443
}

# Example deletion
resource "aws_network_acl" "nacl_deletion" {
  count           = var.delete_nacl ? 1 : 0
  network_acl_id  = module.nacl.nacl_id
  delete          = true
}

