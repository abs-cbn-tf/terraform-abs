variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "ap-southeast-1"
}

# Variables for the cluster
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

# Variables for the task definitions
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

variable "container_definitions" {
  description = "Container Definitions"
  type        = string
  default     = <<EOF
[
  {
    "name": "my-container",
    "image": "nginx:latest",
    "cpu": 512,
    "memory": 256,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80,
        "protocol": "tcp"
      }
    ]
  }
]
EOF
}

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
