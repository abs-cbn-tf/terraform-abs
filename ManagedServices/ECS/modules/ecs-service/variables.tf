# Variables for the task definition
variable "task_family" {
  description = "Family for task (name)"
  type        = string
}

variable "task_cpu" {
  description = "CPU for task"
  type        = string
}

variable "task_memory" {
  description = "Memory for task"
  type        = string
}

variable "task_role_name" {
  description = "Role name for task"
  type        = string
}

variable "network_mode" {
  description = "Network mode for task"
  type        = string
}

variable "container_definitions" {
  description = "Container Definitions"
  type        = string
}

variable "requires_compatibilities" {
  description = "Container Definitions"
  type        = string
}

variable "operating_system" {
  description = "Container Definitions"
  type        = string
}

variable "cpu_architecture" {
  description = "Container Definitions"
  type        = string
}

# Variables for the service
variable "service_name" {
  description = "Container Definitions"
  type        = string
}

variable "service_role_name" {
  description = "Container Definitions"
  type        = string
}
