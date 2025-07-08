locals {
  name = "${var.project_name}-${var.environment}-eks"
  tags = {
    "Environment" = var.environment
    "Project"     = var.project_name
  }
}

resource "aws_lambda_function" "this" {
  function_name = var.function_name
  role          = var.role_arn
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  timeout       = 5
  memory_size   = 128

  filename         = "${path.module}/lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda.zip")

  environment {
    variables = {
      TABLE_NAME = var.table_name
    }
  }

  depends_on = [null_resource.lambda_zip]
}

resource "null_resource" "lambda_zip" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "cd ${path.module}/src && zip -r ../lambda.zip ."
  }
}
