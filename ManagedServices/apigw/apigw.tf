module "apigw" {
  source        = "./modules" # Mandatory
  aws_region    = var.aws_region
  apigw_name    = var.apigw_name
  resource_name = var.resource_name
  method_name   = var.method_name
  stage_name    = var.stage_name
}
