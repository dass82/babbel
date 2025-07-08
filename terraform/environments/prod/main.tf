locals {
  name = "${var.project_name}-${var.environment}"
  tags = {
    "Environment" = var.environment
    "Project"     = var.project_name
  }
}

# DynamoDB module
module "dynamodb" {
  source     = "../../modules/dynamodb"
  table_name = "${var.environment}-url-shortener"
}

# IAM module for Lambda role
module "iam" {
  source     = "../../modules/iam"
  dynamo_arn = module.dynamodb.table_arn
  role_name  = "${var.environment}-url-shortener-lambda-role"
}

# Lambda module
module "lambda" {
  source        = "../../modules/lambda"
  table_name    = module.dynamodb.table_name
  role_arn      = module.iam.lambda_role_arn
  function_name = "${var.environment}-url-shortener"
}

# API Gateway module
module "api_gateway" {
  source             = "../../modules/api-gateway"
  name               = "${var.environment}-url-shortener"
  target_lambda_arn  = module.lambda.invoke_arn
  create_api_key     = true
  cors_allow_origins = ["*"]
  cors_allow_methods = ["GET", "POST"]
}