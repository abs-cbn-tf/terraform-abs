# modules/application-load-balancer/main.tf
variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default = "vpc-3a9b1451"
}

variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "listener_port" {
  description = "Port for the ALB listener"
  type        = number
}

variable "listener_protocol" {
  description = "Protocol for the ALB listener"
  type        = string
}

variable "container_name" {
  description = "Name of the container to attach to the target group"
  type        = string
}

variable "container_port" {
  description = "Port of the container to attach to the target group"
  type        = number
}

variable "alb_security_group_id" {
  description = "Security group ID for the ALB"
  type        = string
}

#variable "alb_subnet_id" {
#  description = "Subnet ID for the ALB"
#  type        = string
#}

variable "alb_subnet_id" {
  description = "List of subnet IDs for the Application Load Balancer"
  type        = list(string)
   default     = ["subnet-6d75c206", "subnet-273c686b"]
}

resource "aws_lb" "application_load_balancer" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]

 # subnet_mapping {
    subnets = var.alb_subnet_id
    #subnet_id = split(",", var.alb_subnet_id)
 # }
}

resource "aws_lb_listener" "application_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application_target_group.arn
  }
}

resource "aws_lb_target_group" "application_target_group" {
  name     = var.target_group_name
  port     = var.container_port
  protocol = var.listener_protocol
  vpc_id      = var.vpc_id 
}

#resource "aws_lb_target_group_attachment" "application_target_group_attachment" {
#  target_group_arn = aws_lb_target_group.application_target_group.arn
#  target_id        = var.container_name
#  port             = var.container_port
#}
output "alb_arn" {
  value = aws_lb.application_load_balancer.arn
}


output "target_group_arn" {
  value = aws_lb_target_group.application_target_group.arn
}
