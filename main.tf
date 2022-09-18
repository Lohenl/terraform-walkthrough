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
  access_key = "your-access-key-here"
  secret_key = "your-secret-key-here"
}

###################################
## PART 1: THE VERY BASIC BUCKET ##
###################################

# Basic S3 bucket
resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "tfdemo20220918-mytestbucket"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# Outputs for all the different bucket names (comment/uncomment where needed)
output "my-test-bucket-id" {
  value       = aws_s3_bucket.my-test-bucket.id
  description = "Bucket A's terraform ID"
}

#######################
## PART 2: VARIABLES ##
#######################

# Basic S3 bucket with variable reference (Let's call this Bucket B)
# resource "aws_s3_bucket" "my-test-bucket-referenced" {
#   bucket = var.bucketname
#   tags = {
#     Name        = "My other bucket"
#     Environment = "Dev"
#   }
# }

# Uploads object to S3 Bucket B (example)
# resource "aws_s3_object" "object" {
#   bucket = aws_s3_bucket.my-test-bucket-referenced.id
#   key    = var.s3objectkey
#   source = var.sourcepath

#   # The filemd5() function is available in Terraform 0.11.12 and later
#   # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
#   # etag = "${md5(file("path/to/file"))}"
#   # etag = filemd5("path/to/file")
# }

# S3 ACL for S3 Bucket B
# resource "aws_s3_bucket_acl" "my-test-bucket-acl" {
#   bucket = aws_s3_bucket.my-test-bucket-referenced.id
#   acl    = "private"
# }

# Uncomment when the Bucket B is uncommented
# output "my-test-bucket-referenced-id" {
#   value       = aws_s3_bucket.my-test-bucket-referenced.id
#   description = "Bucket B's terraform ID"
# }

#########################
## PART 3: FROM MODULE ##
#########################

# S3 Bucket from a local module (Let's call this bucket C)
# module "my-bucket-module" {
#   source     = "./modules/my-module"
#   bucketname = "tfdemo20220918-mymodulevariablebucket-overriden"
# }

# Uncomment when the Bucket C is uncommented
# output "my-bucket-module-id" {
#   value       = module.my-bucket-module.bucketID
#   description = "Bucket C's terraform ID"
# }

# Uncomment when the Bucket C is uncommented
# Note that the root module also has to declare the exported value as sensitive
# output "my-module-sensitive-value" {
#   value       = module.my-bucket-module.sensitivevalue
#   description = "Example of an exported sensiive value"
#   sensitive   = true
# }
