# Basic S3 bucket with variable reference
resource "aws_s3_bucket" "my-test-bucket-referenced" {
  bucket = var.bucketname
  tags = {
    Name        = "My other bucket"
    Environment = "Dev"
  }
}

# Uploads object to S3 bucket (example)
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.my-test-bucket-referenced.id
  key    = var.s3objectkey
  source = var.sourcepath

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  # etag = filemd5("path/to/file")
}


# S3 ACL for demo bucket to allow PUT access with key
resource "aws_s3_bucket_acl" "my-test-bucket-acl" {
  bucket = aws_s3_bucket.my-test-bucket-referenced.id
  acl    = "private"
}