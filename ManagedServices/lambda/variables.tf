# Input Variables
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "ap-southeast-1"
}

# essential variables for Lambda 
variable "function_name" {
  description = "Variable that sets lambda name"
  type        = string
  default     = "terraform-lambda-function"
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
  default     = "iam-role-for-terraform-lambda"
}

variable "memory" {
  description = "Memory size for the lambda"
  type        = string
  default     = "129"
}

#environment variables
variable "value1" {
  description = "value for var1"
  type        = string
  default     = "value1"
}

variable "value2" {
  description = "value for var2"
  type        = string
  default     = "value2"
}

variable "value3" {
  description = "value for var3"
  type        = string
  default     = "value3"
}

## Create Variable for Lambda Function Tags
variable "my_lambda_tags" {
  description = "Tags to set on the lambda"
  type        = map(string)
  default = {
    App         = "IMP"
    Environment = "Sandbox"
  }
}
