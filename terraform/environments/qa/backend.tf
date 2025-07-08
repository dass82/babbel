terraform {
  backend "s3" {
    bucket  = "terraform-state-bucket/" 
    encrypt = true
    key     = "qa/terraform.tfstate"
    region  = "us-east-1"
  }
}