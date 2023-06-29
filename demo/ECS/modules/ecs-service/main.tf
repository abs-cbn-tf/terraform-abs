resource "aws_ecs_task_definition" "taskdef" {
  family = var.task_family
  # container_definitions = var.container_definitions
  container_definitions    = <<EOF
    [
      {
        "name": "${var.container_name}",
        "image": "${var.container_image}",
        "cpu": ${var.container_cpu},
        "memory": ${var.container_memory},
        "portMappings": [
          {
            "containerPort": ${var.container_cport},
            "hostPort": ${var.container_hport},
            "protocol": "${var.container_protocol}"
          }
        ]
      }  
    ]
  EOF
  execution_role_arn       = aws_iam_role.role.arn
  task_role_arn            = aws_iam_role.role.arn
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  network_mode             = var.network_mode
  requires_compatibilities = ["${var.requires_compatibilities}"]
  runtime_platform {
    operating_system_family = var.operating_system
    cpu_architecture        = var.cpu_architecture
  }
  #   volume {
  #     name      = "service-storage"
  #     host_path = "/ecs/service-storage"
  #   }

  #   placement_constraints {
  #     type       = "memberOf"
  #     expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  #   }
}

# ecsTaskExecutionRole
resource "aws_iam_role" "role" {
  name = var.task_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = [
            "ecs.amazonaws.com",
            "ecs-tasks.amazonaws.com"
          ]
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach1" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "attach2" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}



data "terraform_remote_state" "ecs_cluster_module" {
  backend = "local"

  config = {
#  #  path = "/Users/ronelmigsjordaperez/Documents/terraform-abs/ManagedServices/ECS/terraform.tfstate"
    path = "/Users/naveen/terraform-abs/28jun2023/terraform-abs/ManagedServices/ECS/terraform.tfstate"
  }
}

data "terraform_remote_state" "alb-outputs" {
  backend = "local"

  config = {
#  #  path = "/Users/ronelmigsjordaperez/Documents/terraform-abs/Iaas/alb/terraform.tfstate"
    path = "/Users/naveen/terraform-abs/alb3/terraform.tfstate"
  }
}

# # Provides an IAM service-linked role
# # IMPORTANT!!
# resource "aws_iam_service_linked_role" "elasticcontainerservice" {
#   aws_service_name = "ecs.amazonaws.com"
#   custom_suffix    = true
# }

# ECS Service
resource "aws_ecs_service" "ecs_service" {
  name                              = var.service_name
#  depends_on                        = [data.terraform_remote_state.ecs_cluster_module]
#  cluster                           = data.terraform_remote_state.ecs_cluster_module.outputs.cluster_arn
  cluster                           = data.terraform_remote_state.ecs_cluster_module.outputs.cluster_arn
  task_definition                   = aws_ecs_task_definition.taskdef.arn
  desired_count                     = 2
  health_check_grace_period_seconds = 300

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  load_balancer {
#    target_group_arn = data.terraform_remote_state.alb-outputs.outputs.target_group_arn #put arn here from output
   target_group_arn = var.push_web_target_group_arn 
   container_name   = var.container_name
    container_port   = 3000

  }

  network_configuration {
    subnets          = var.public_subnets       # Replace with your subnet IDs
    security_groups  = ["sg-0e9a6a8e0c7c926f1"] # Replace with your security group IDs
    assign_public_ip = true
  }
}


