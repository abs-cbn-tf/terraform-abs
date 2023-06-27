# Output definitions

output "lambda_arn" {
  description = "ARN of the lambda function"
  value       = [for i in module.lambda_function : i.arn]
}

output "invoke_arn" {
  description = "ARN of the lambda function"
  value       = [for i in module.lambda_function : i.invoke_arn]
}

output "lambda_name" {
  description = "Name of the lambda function"
  value       = [for i in module.lambda_function : i.name]
}


