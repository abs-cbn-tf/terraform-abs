resource "aws_alb" "alb" {
  name            = var.alb_name
  subnets         = var.subnets
  security_groups = var.security_groups
#   vpc_id   = var.vpc_id
}

resource "aws_alb_target_group" "target_group" {
  name     = var.target_group_name
  port     = var.target_group_port
  protocol = "HTTP"
   vpc_id   = var.vpc_id

}

output "target_group_arn" {
  value = aws_alb_target_group.target_group.arn
}

