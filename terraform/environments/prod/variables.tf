variable "aws_region" {
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "environment name for the project"
}

variable "project_name" {
  type        = string
  description = "project name"
}