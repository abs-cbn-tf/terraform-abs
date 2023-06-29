#Create rest api
resource "aws_api_gateway_rest_api" "my_rest_api" {
  name        = var.apigw_name
  description = "My API Gateway REST API"
}

# apigw usage plan w/ API keys
# no method throttling yet
resource "aws_api_gateway_usage_plan" "myusageplan" {
  name = var.usage_plan

  throttle_settings {
    burst_limit = 100
    rate_limit  = 50
  }
  quota_settings {
    limit  = 5000
    period = "MONTH"
  }
}

resource "aws_api_gateway_api_key" "mykey" {
  name = var.api_key
}

resource "aws_api_gateway_usage_plan_key" "main" {
  key_id        = aws_api_gateway_api_key.mykey.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.myusageplan.id
}
