aws_region = "ap-southeast-1"
# variables for apigw
apigw_name    = "IMP-APIGW"
resource_name = "{proxy+}"
method_name   = "ANY"
stage_name    = "dev"
api_key       = "imp-api-key"
usage_plan    = "imp-usage-plan"

# variables for lambda
function_name = "imp-test-api"
runtime       = "nodejs18.x"
handler       = "index.handler"
iam_role_name = "imp-test-api-role"
memory        = 128
env_var = {
  var1 = "tfvars1"
  var2 = "tfvars2"
}
my_lambda_tags = {
  Application = "Push"
  Environment = "Demo"
}
# ALB VARIABLES

listener_port     = 80
target_group_name = "imp-alb-tg"
target_group_port = 80
# listener_cert_arn
alb_name = "imp-alb"

# ECS CLUSTER VARIABLES 
tf_my_cluster        = "imp-cluster"
tf_capacity_provider = "FARGATE_SPOT"

#ECS SERVICE VARIABLES
task_family    = "imp-taskdef"
task_cpu       = "1024"
task_memory    = "2048"
task_role_name = "imp-taskdef-role"
network_mode   = "awsvpc"
ecs_lb_cport   = 80

# Container Definition Variables
container_name     = "my-container"
container_image    = "nginx:latest"
container_cpu      = 256
container_memory   = 512
container_cport    = 80
container_hport    = 80
container_protocol = "tcp"
# EOF Container Definitions Variables
requires_compatibilities = "FARGATE"
operating_system         = "LINUX"
cpu_architecture         = "X86_64"

# Variables for the service
service_name      = "IMP-Service"
service_role_name = "IMP-service-role"


project_name                 = "consumption"
vpc_cidr                     = "10.195.80.0/21"
public_subnet_az1_cidr       = "10.195.80.0/24"
public_subnet_az1_abs        = "consumption-subnet-public1-ap-southeast-1a"
public_subnet_az2_cidr       = "10.195.81.0/24"
public_subnet_az2_abs        = "consumption-subnet-public2-ap-southeast-1b"
private_app_subnet_az1_cidr  = "10.195.82.0/24"
private_app_subnet_az1_abs   = "consumption-subnet-private1-ap-southeast-1a"
private_app_subnet_az2_cidr  = "10.195.83.0/24"
private_app_subnet_az2_abs   = "consumption-subnet-private2-ap-southeast-1b"
private_data_subnet_az1_cidr = "10.195.84.0/24"
private_data_subnet_az1_abs  = "consumption-subnet-private3-ap-southeast-1a"
private_data_subnet_az2_cidr = "10.195.85.0/24"
private_data_subnet_az2_abs  = "consumption-subnet-private4-ap-southeast-1b"
#cidr_out_sg="0.0.0.0"
# egress_cidr_blocks = "0.0.0.0"
vpc_tags = {
  Name = "consumption"
}

## Variables for SG
# for ecs sg
ecs_sg_ingress_from     = 80
ecs_sg_ingress_to       = 80
ecs_sg_ingress_protocol = "tcp"
ecs_sg_ingress_cidr     = "0.0.0.0/0"
ecs_sg_egress_from      = 0
ecs_sg_egress_to        = 0
ecs_sg_egress_protocol  = "-1"
ecs_sg_egress_cidr      = "0.0.0.0/0"
# for regular sg
web_sg_ingress_from     = 80
web_sg_ingress_to       = 80
web_sg_ingress_protocol = "tcp"
web_sg_ingress_cidr     = "0.0.0.0/0"
web_sg_egress_from      = 0
web_sg_egress_to        = 0
web_sg_egress_protocol  = "-1"
web_sg_egress_cidr      = "0.0.0.0/0"
