terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider (access and secret keys should be hidden)
provider "aws" {
  region     = "ap-southeast-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

# Basic S3 bucket with tags
resource "aws_s3_bucket" "my-test-bucket" {
  bucket = var.bucketname
  tags = {
    Name        = "My Bucket"
    Environment = "Dev"
  }
}

# Inserts object to S3 Bucket
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.my-test-bucket.id
  key    = var.s3objectkey
  source = var.sourcepath
}

# Blocking public access to S3 Bucket
resource "aws_s3_bucket_public_access_block" "my-test-bucket-access-block" {
  bucket = aws_s3_bucket.my-test-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

output "my-test-bucket-id" {
  value       = aws_s3_bucket.my-test-bucket.id
  description = "Bucket's terraform ID"
}

output "my-sensitive-value" {
  value       = var.sensitivevalue
  description = "Local sensitive value, masked in output but not tfstate"
  sensitive   = true
}
