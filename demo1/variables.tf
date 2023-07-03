variable "aws_region" {}
# variables for apigw
variable "apigw_name" {}
variable "resource_name" {}
variable "method_name" {}
variable "stage_name" {}
variable "api_key" {}
variable "usage_plan" {}

# variables for lambda
variable "function_name" {}
variable "runtime" {}
variable "handler" {}
variable "iam_role_name" {}
variable "memory" {}

# environment variables for lambda
variable "env_var" {
  type = map(string)
}
variable "my_lambda_tags" {
  type = map(string)
}

# ALB VARIABLES
/*
variable "vpc_id" {
  default = module.vpc.vpc_id
}
variable "subnets" {
  default = [module.vpc.public_subnet_az1_id, module.vpc.public_subnet_az2_id]
}
*/
//variable "security_groups" {}
variable "listener_port" {}
variable "target_group_name" {}
variable "target_group_port" {}
# variable "listener_cert_arn" {}
variable "alb_name" {}

# ECS CLUSTER VARIABLES 
variable "tf_my_cluster" {}
variable "tf_capacity_provider" {}

#ECS SERVICE VARIABLES
variable "task_family" {}
variable "task_cpu" {}
variable "task_memory" {}
variable "task_role_name" {}
variable "network_mode" {}

# Container Definition Variables
variable "container_name" {}
variable "container_image" {}
variable "container_cpu" {}
variable "container_memory" {}
variable "container_cport" {}
variable "container_hport" {}
variable "container_protocol" {}
variable "requires_compatibilities" {}
variable "operating_system" {}
variable "cpu_architecture" {}

# Variables for the service
variable "service_name" {}

variable "service_role_name" {}

//variable "public_subnets" {}

variable "project_name" {}
variable "vpc_cidr" {}
variable "public_subnet_az1_cidr" {}
variable "public_subnet_az2_cidr" {}
variable "private_app_subnet_az1_cidr" {}
variable "private_app_subnet_az2_cidr" {}
variable "private_data_subnet_az1_cidr" {}
variable "private_data_subnet_az2_cidr" {}
variable "public_subnet_az1_abs" {}
variable "public_subnet_az2_abs" {}
variable "private_app_subnet_az1_abs" {}
variable "private_app_subnet_az2_abs" {}
variable "private_data_subnet_az1_abs" {}
variable "private_data_subnet_az2_abs" {}
variable "vpc_tags" {}
