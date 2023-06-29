# Input Variables
variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "function_name" {
  description = "aws region"
  type        = string
}

variable "runtime" {
  description = "runtime"
  type        = string
}

variable "handler" {
  description = "handler"
  type        = string
}

variable "iam_role_name" {
  description = "role name"
  type        = string
}

variable "memory" {
  description = "memory size"
  type        = string
}

variable "value1" {
  description = "value for var1"
  type        = string
}
variable "value2" {
  description = "value for var2"
  type        = string
}
variable "value3" {
  description = "value for var3"
  type        = string
}

variable "tags" {
  description = "Tags to set on the lambda"
  type        = map(string)
  default     = {}
}
