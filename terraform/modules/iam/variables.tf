variable "environment" {
    type = string
    description = "environment name for the project"  
}

variable "project_name" {
    type = string
    description = "project name"  
}

variable "dynamo_arn" {
  description = "ARN of DynamoDB table"
  type        = string
}

variable "role_name" {
  description = "IAM Role name"
  type        = string
}