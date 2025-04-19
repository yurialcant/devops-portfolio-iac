terraform {
  backend "s3" {
    bucket         = "backend-iac-1"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}
