# API Gateway and Lambda Module

This Terraform module sets up an API Gateway with an integrated AWS Lambda function.

## Usage

```hcl
module "apigw_lambda" {
  source        = "./modules/apigw-lambda" # Mandatory
  aws_region    = var.aws_region
  apigw_name    = var.apigw_name
  resource_name = var.resource_name
  method_name   = var.method_name
  stage_name    = var.stage_name
  api_key       = var.api_key
  usage_plan    = var.usage_plan
}
```

## Input

- **source**:
- **aws_region**:
- **apigw_name**: (Required) The name for the API Gateway.
- **stage_name**: (Optional) The stage name of the API Gateway stage. Default value is "dev".
- **resource_name**: The resource name set inside the API.
- **method_name**: The method name set inside the API.
- **api_key**: API Key name
- **usage_plan**: U

## Output

- **api_gateway_invoke_url**: The invoke URL of the API Gateway.