module "lambda_function" {
  source     = "./modules" # Mandatory
  aws_region = var.aws_region

  count         = var.lambda_count
  function_name = var.function_name[count.index]
  iam_role_name = var.iam_role_name[count.index]

  runtime = var.runtime
  handler = var.handler
  memory  = var.memory
  value1  = var.value1
  value2  = var.value2
  value3  = var.value3
  tags    = var.my_lambda_tags
}

