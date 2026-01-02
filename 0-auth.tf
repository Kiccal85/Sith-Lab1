# Terraform configuration block
# This defines the minimum Terraform version and required providers
terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# terraform {
#   backend "s3" {
#     bucket = "krypto-k-bucket"
#     key    = "my/day/sucks/ass/terraform.tfstate"
#     region = "us-east-2"
#   }
# }

# AWS Provider configuration
# This tells Terraform how to connect to AWS
provider "aws" {
  region = "us-east-1"
  profile = "default"
}

#
variable "availability_zones" {
  description = "List of availability zones"
  type        = list
  default     = ["us-east-1a", "us-east-1b"]
}

  # # Default tags are applied to all resources created by this provider
  # default_tags {
  #   tags = {
  #     Project     = "vpc-demo"
  #     Environment = "dev"
  #     ManagedBy   = "Terraform"
  #   }
  # }
