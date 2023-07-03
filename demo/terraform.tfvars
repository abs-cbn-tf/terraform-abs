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
vpc_id          = "vpc-0cbd8776bdd708ee5"
subnets         = ["subnet-09fbd69c967ec2b13", "subnet-02e234f573a5e7a53"]
security_groups = ["sg-0e028cc09f558e6c8"]

listener_port     = 80
target_group_name = "imp-alb-tg"
target_group_port = 3000
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

# Container Definition Variables
container_name     = "my-container"
container_image    = "892339339186.dkr.ecr.ap-southeast-1.amazonaws.com/test-app"
container_cpu      = 256
container_memory   = 512
container_cport    = 3000
container_hport    = 3000
container_protocol = "tcp"
# EOF Container Definitions Variables
requires_compatibilities = "FARGATE"
operating_system         = "LINUX"
cpu_architecture         = "X86_64"

# Variables for the service
service_name      = "IMP-Service"
service_role_name = "IMP-service-role"
public_subnets    = ["subnet-09fbd69c967ec2b13", "subnet-02e234f573a5e7a53"]

