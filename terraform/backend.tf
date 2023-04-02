terraform {
  backend "s3" {
    bucket         = "cloudservices-test-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state"
  }
}