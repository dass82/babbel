output "api_endpoint" {
  value = "${aws_api_gateway_deployment.deployment.invoke_url}"
}

output "api_gateway_arn" {
  value = aws_api_gateway_rest_api.api.execution_arn
}

output "api_key" {
  value = aws_api_gateway_api_key.api_key.value
}

