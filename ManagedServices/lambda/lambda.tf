module "lambda_function" {
  source        = "./modules" # Mandatory
  aws_region    = var.aws_region
  function_name = var.function_name
  runtime       = var.runtime
  handler       = var.handler
  iam_role_name = var.iam_role_name
  memory        = var.memory
  value1        = var.value1
  value2        = var.value2
  value3        = var.value3
  tags          = var.my_lambda_tags
}
