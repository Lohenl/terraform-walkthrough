variable "access_key" {
  type        = string
  description = "Access key for AWS provider"
  default     = "your-access-key-here"
  sensitive   = true
}

variable "secret_key" {
  type        = string
  description = "Access key for AWS provider"
  default     = "your-secret-key-here"
  sensitive   = true
}

variable "bucketname" {
  type        = string
  description = "Bucket name, must be globally unique"
  default     = "tfdemo20221027-mycoolbucket"
}

variable "s3objectkey" {
  type        = string
  description = "S3 object key for upload file"
  default     = "/public/test.txt"
}

variable "sourcepath" {
  type        = string
  description = "Path to file for upload"
  default     = "./test-files/test.txt"
}

variable "sensitivevalue" {
  type        = string
  description = "Example of a sensitive value"
  default     = "mysecretpassword"
  sensitive   = true
}