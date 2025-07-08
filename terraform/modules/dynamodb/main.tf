locals {
  name = "${var.project_name}-${var.environment}-eks"
  tags = {
    "Environment" = var.environment
    "Project"     = var.project_name
  }
}

resource "aws_dynamodb_table" "url_shortener" {
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "short_code"

  attribute {
    name = "short_code"
    type = "S"
  }

  attribute {
    name = "original_url"
    type = "S"
  }

  ttl {
    attribute_name = "ttl"
    enabled        = true
  }

  tags = local.tags
}
