variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "ap-southeast-1"
}

# variables for apigw
variable "apigw_name" {
  description = "Name for apigw"
  type        = string
  default     = "terraform-apigw"
}

variable "resource_name" {
  description = "Name for the resource"
  type        = string
  default     = "{proxy+}"
}

variable "method_name" {
  description = "Name for the method"
  type        = string
  default     = "ANY"
}

variable "stage_name" {
  description = "Name for stage"
  type        = string
  default     = "dev"
}

variable "api_key" {
  description = "Name for api key"
  type        = string
  default     = "terraform_api_key"
}

variable "usage_plan" {
  description = "Name for usage plan"
  type        = string
  default     = "terraform_usage_plan"
}

# variables for lambda
variable "function_name" {
  type    = string
  default = "imp-page-api"
}

variable "runtime" {
  description = "Runtime version"
  type        = string
  default     = "nodejs16.x"
}

variable "handler" {
  description = "Lambda function handler"
  type        = string
  default     = "index.handler"
}

variable "iam_role_name" {
  description = "Role name for the lambda"
  type        = string
  default     = "imp-content-api-role"
}

variable "memory" {
  description = "Memory size for the lambda"
  type        = string
  default     = "129"
}

## environment variables

variable "env_var" {
  description = "Tags to set on the lambda"
  type        = map(string)
  default = {
    var1 = "val1"
    var2 = "val2"
  }

}

## Create Variable for Lambda Function Tags
variable "my_lambda_tags" {
  description = "Tags to set on the lambda"
  type        = map(string)
  default = {
    Application = "Push"
    Environment = "Demo"
  }

}

# ALB VARIABLES
variable "vpc_id" {
  description = "vpc id for alb"
  type        = string
  default     = "vpc-0cbd8776bdd708ee5"
}

variable "subnets" {
  description = "subnets for alb"
  type        = list(string)
  default = [
    "subnet-09fbd69c967ec2b13", # Sandbox existing subnets
    "subnet-02e234f573a5e7a53"
  ]
}

variable "security_groups" {
  description = "security groups for alb"
  type        = list(string)
  default = [
    "sg-0e028cc09f558e6c8"
  ]
}

variable "listener_port" {
  description = "listener port"
  type        = number
  default     = 80
}

variable "target_group_name" {
  description = "target group name"
  type        = string
  default     = "terraform-tg"
}

variable "target_group_port" {
  description = "target group port"
  type        = number
  default     = 3000
}

# variable "listener_cert_arn" {
#   description = "exsisting listener certificate"
#   type        = string
#   default     = "arn:aws:acm:ap-southeast-1:892339339186:certificate/43e748ed-311b-4559-9b9a-ae69de43ae13"
# }

variable "alb_name" {
  description = "alb name"
  type        = string
  default     = "terraform-alb"
}

# ECS CLUSTER VARIABLES 
variable "tf_my_cluster" {
  description = "name for cluster"
  type        = string
  default     = "terraform_cluster"
}

variable "tf_capacity_provider" {
  description = "Type of provider (fagate or fargate spot)"
  type        = string
  default     = "FARGATE_SPOT"
}

#ECS SERVICE VARIABLES
variable "task_family" {
  description = "Family for task (name)"
  type        = string
  default     = "terraform-taskdef"
}

variable "task_cpu" {
  description = "CPU for task"
  type        = string
  default     = 1024
}

variable "task_memory" {
  description = "Memory for task"
  type        = string
  default     = 2048
}

variable "task_role_name" {
  description = "Role name for task"
  type        = string
  default     = "terraform-task-execution-role"
}

variable "network_mode" {
  description = "Network mode for task"
  type        = string
  default     = "awsvpc"
}

# Container Definition Variables
variable "container_name" {
  description = "Container Name"
  type        = string
  default     = "my-container"
}
variable "container_image" {
  description = "Container Image"
  type        = string
  default     = "892339339186.dkr.ecr.ap-southeast-1.amazonaws.com/test-app"
}
variable "container_cpu" {
  description = "Container CPU"
  type        = string
  default     = 256
}
variable "container_memory" {
  description = "Container Memory"
  type        = string
  default     = 512
}
variable "container_cport" {
  description = "Container Container Port"
  type        = string
  default     = 3000
}
variable "container_hport" {
  description = "Container Host Port"
  type        = string
  default     = 3000
}
variable "container_protocol" {
  description = "Container Protocol"
  type        = string
  default     = "tcp"
}
# EOF Container Definitions Variables
variable "requires_compatibilities" {
  description = "Container Definitions"
  type        = string
  default     = "FARGATE"
}

variable "operating_system" {
  description = "Container Definitions"
  type        = string
  default     = "LINUX"
}

variable "cpu_architecture" {
  description = "Container Definitions"
  type        = string
  default     = "X86_64"
}

# Variables for the service
variable "service_name" {
  description = "Container Definitions"
  type        = string
  default     = "terraform-service"
}

variable "service_role_name" {
  description = "Container Definitions"
  type        = string
  default     = "terraform-service-role"
}

variable "public_subnets" {
  description = "Public subnets"
  type        = list(string)
  default = [
    "subnet-09fbd69c967ec2b13", # Sandbox existing subnets
    "subnet-02e234f573a5e7a53"
  ]
}

