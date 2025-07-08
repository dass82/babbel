terraform {
  backend "s3" {
    bucket  = "terraform-state-bucket/" 
    encrypt = true
    key     = "prod/terraform.tfstate"
    region  = "us-east-1"
  }
}