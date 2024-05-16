# Terraform Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.50.0"
    }
  }
}

# Provider-1 for us-east-1 (Default Provider)
provider "aws" {
  region = "us-east-1"
  profile = "default"
}

# Provider-2 for us-west-1
provider "aws" {
  alias    = "secondary"
  access_key = "AKIAUJ25EBRLFVHUFNH2"
  secret_key = "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"
  region = "ap-south-1"
}

resource "aws_instance" "primary_instance" {
   ami  = "ami-080e1f13689e07408"
   instance_type ="t2.micro"
   tags = {
     "Name" = "primary"
    }

}
resource "aws_instance" "secondary_instances" {
   provider = aws.secondary
   ami  = "ami-013168dc3850ef002"
   instance_type ="t2.micro"
   tags = {
     "Name" = "secondary"
   }

}