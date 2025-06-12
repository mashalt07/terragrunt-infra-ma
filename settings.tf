terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-ma"
    key = "test/terraform.tfstate"
    region = "eu-west-2"
  }
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
    region = "eu-west-2"
}