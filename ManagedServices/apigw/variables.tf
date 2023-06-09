variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "ap-southeast-1"
}

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
