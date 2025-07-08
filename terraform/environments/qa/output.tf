output "invoke_url" {
  description = "API Gateway invoke URL"
  value       = module.api_gateway.api_endpoint
}

output "lambda_function_name" {
  description = "Lambda function name"
  value       = module.lambda.function_name
}

output "dynamodb_table_name" {
  description = "DynamoDB Table name"
  value       = module.dynamodb.table_name
}

output "api_key_value" {
  description = "API Key value for API Gateway"
  value       = module.api_gateway.api_key_value
  sensitive   = true
}