provider "aws" {
  region = "us-east-1"
}

module "autoscaling" {
  source                  = "./modules/autoscaling"
  vpc_id                  = var.vpc_id
  subnet_ids              = var.subnet_ids
  ami_id                  = var.ami_id
  instance_type           = var.instance_type
  min_size                = var.min_size
  max_size                = var.max_size
  desired_capacity        = var.desired_capacity
  scale_out_cpu_threshold = 70
  scale_in_cpu_threshold  = 30
#  tags = {
#    Environment = "production"
#    Project     = "my-project"
#  }
  start_recurrence = "0 9 * * MON-FRI"
  stop_recurrence  = "0 18 * * MON-FRI"
#  availability_zones = var.availability_zones
}

