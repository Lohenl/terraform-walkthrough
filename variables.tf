variable "bucketname" {
    type = string
    description = "Bucket name, must be globally unique"
    default = "tfdemo20220918-myvariablebucket"
}

variable "s3objectkey" {
    type = string
    description = "S3 object key for upload file"
    default = "/public/test.txt"
}

variable "sourcepath" {
    type = string
    description = "Path to file for upload"
    default = "./test-files/test.txt"
}

variable "sensitivevalue" {
    type = string
    description = "Example of a sensitive value"
    default = "secret"
    sensitive = true
}