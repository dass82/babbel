provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    s3              = "http://localhost:4566"
    iam             = "http://localhost:4566"
    ec2             = "http://localhost:4566"
    eks             = "http://localhost:4566"
    kms             = "http://localhost:4566"
    cloudformation  = "http://localhost:4566"
    sts             = "http://localhost:4566"
    cloudwatchlogs  = "http://localhost:4566"
    dynamodb        = "http://localhost:4566"
    lambda          = "http://localhost:4566"
    apigateway      = "http://localhost:4566"
    apigatewayv2    = "http://localhost:4566"
  }
}