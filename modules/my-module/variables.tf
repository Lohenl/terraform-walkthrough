variable "bucketname" {
    type = string
    description = "Bucket name, must be globally unique"
    default = "tfdemo20220918-mymodulevariablebucket"
}

variable "s3objectkey" {
    type = string
    description = "S3 object key for upload file"
    default = "/public/other-test.txt"
}

variable "sourcepath" {
    type = string
    description = "Path to file for upload"
    default = "./test-files/other-test.txt"
}

variable "sensitivevalue" {
    type = string
    description = "Sample sensitive value"
    default = "secret"
    sensitive = true
}