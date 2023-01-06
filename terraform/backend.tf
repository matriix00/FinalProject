terraform {
  backend "s3" {
    bucket         = "cloudservices-final-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state"
  }
}