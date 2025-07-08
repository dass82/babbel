output "invoke_arn" {
  value = aws_lambda_function.url_shortener.invoke_arn
}

output "function_name" {
  value = aws_lambda_function.url_shortener.function_name
}