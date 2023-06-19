terraform {
  required_version = ">= 1.0.0"
  backend "local" {}
}

provider "aws" {
  region = "us-east-1"
}

module "alb" {
  source                = "./modules/alb"
  alb_name              = "my-alb"
  subnets               = ["subnet-5999ae2e", "subnet-c21d549b"]
  security_groups       = ["sg-97fe46f0"]
  listener_port         = 80
  target_group_name     = "my-target-group"
  target_group_port     = 8080
  vpc_id = "vpc-5a35d53e"
  listener_rules = [
    {
      priority  = 1
      condition = {
        host_header = "abs-cbn.com"
      }
      action = {
        target_group_arn = module.alb.target_group_arn
        type             = "forward"
      }
    },
    {
      priority  = 2
      condition = {
        host_header = "abs-new.com"
      }
      action = {
        target_group_arn = module.alb.target_group_arn
        type             = "forward"
      }
    }
  ]
}

