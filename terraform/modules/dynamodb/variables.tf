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

variable "tags" {
  type = map(string)
}