terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta2"
    }
  }
  required_version = "~> 1.9.8"
}

provider "aws" {
  region = var.aws_region
}