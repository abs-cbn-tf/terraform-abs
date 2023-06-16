module "ecs-cluster" {
  source               = "./modules/ecs-cluster"
  tf_capacity_provider = var.tf_capacity_provider
  tf_my_cluster        = var.tf_my_cluster
}

module "ecs-service" {
  source = "./modules/ecs-service"
  # taskdef
  task_family              = var.task_family
  task_role_name           = var.task_role_name
  task_cpu                 = var.task_cpu
  task_memory              = var.task_memory
  network_mode             = var.network_mode
  container_definitions    = var.container_definitions
  requires_compatibilities = var.requires_compatibilities
  operating_system         = var.operating_system
  cpu_architecture         = var.cpu_architecture
  # service 
  service_name      = var.service_name
  service_role_name = var.service_role_name
}
