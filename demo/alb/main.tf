# main.tf

provider "aws" {
  region = "us-east-2"
  profile = "default"
}

module "push_web_alb" {
  source              = "./modules/application-load-balancer"
  alb_name            = "push-web-alb"
  target_group_name   = "push-web-tg"
  listener_port       = 80
  listener_protocol   = "HTTP"
  container_name      = "push-web-container"
  container_port      = 8080
  alb_security_group_id = "sg-47a17232"  # Replace with your security group ID
#  alb_subnet_id        = ["subnet-6d75c206", "subnet-273c686b"]  # Replace with your subnet ID
  alb_subnet_id        = var.alb_subnet_id  # Replace with your subnet ID
#  vpc_id               = "vpc-3a9b1451"  # Replace with your VPC ID
}

module "ent_web_alb" {
  source              = "./modules/application-load-balancer"
  alb_name            = "ent-web-alb"
  target_group_name   = "ent-web-tg"
  listener_port       = 80
  listener_protocol   = "HTTP"
  container_name      = "ent-web-container"
  container_port      = 8080
  alb_security_group_id = "sg-47a17232"  # Replace with your security group ID
  alb_subnet_id        = var.alb_subnet_id  # Replace with your subnet ID
#  alb_subnet_id        = ["subnet-6d75c206", "subnet-273c686b"]  # Replace with your subnet ID
 # vpc_id               = "vpc-3a9b1451"  # Replace with your VPC ID
}

#output "alb_arn" {
#  value = module.push_web_alb.target_group__arn
        
#}


#output "target_group_arn" {
#  value = module.push_web_alb.aws_lb_target_group.application_target_group.arn
        
#}
#aws_lb_target_group.application_target_group.arn

#output "push_web_target_group_arn" {
#  value = module.push_web_alb.target_group_arn
#}

#output "ent_web_target_group_arn" {
#  value = module.ent_web_alb.target_group_arn
#}
