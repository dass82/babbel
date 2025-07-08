variable "environment" {
    type = string
    description = "environment name for the project"  
}

variable "project_name" {
    type = string
    description = "project name"  
}

variable "name" {
  description = "API Gateway name"
  type        = string
}

variable "target_arn" {
  description = "Lambda function ARN"
  type        = string
}

variable "stage_name" {
  description = "Stage name"
  type        = string
}


variable "tags" {
  type = map(string)
}