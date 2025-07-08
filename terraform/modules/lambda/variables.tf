variable "environment" {
    type = string
    description = "environment name for the project"  
}

variable "project_name" {
    type = string
    description = "project name"  
}

variable "table_name" {
  description = "DynamoDB table name"
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN for Lambda"
  type        = string
}

variable "function_name" {
  description = "Lambda function name"
  type        = string
}

variable "name" {
    type = string  
}

variable "tags" {
  type = map(string)
}