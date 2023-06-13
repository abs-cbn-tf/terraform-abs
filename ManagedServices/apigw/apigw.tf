module "apigw" {
  source        = "./modules" # Mandatory
  aws_region    = var.aws_region
  apigw_name    = var.apigw_name
  resource_name = var.resource_name
  method_name   = var.method_name
  stage_name    = var.stage_name
  api_key       = var.api_key
  usage_plan    = var.usage_plan

}
