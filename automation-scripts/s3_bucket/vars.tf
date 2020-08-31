## S3 Bucket variables
variable "bucket_name" {
        type = string
	description = "S3 Bucket Name for Images"
}

variable "bucket_acl" {
        type = string
	description = "ACL for S3 Bucket"
}

## Note: This vlue is set to true. Kindly set to false in Production environment
variable "force_destroy_bucket" {
        type = bool
        description = "Parmater indicates that the objects from the bucket to be deleted, so that bucket can be destroyed without error"
}

