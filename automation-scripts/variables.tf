variable "region_name" {
    type = string
    description = "Region Name"
}

variable "user_profile" {
    type = string   
    description = "AWS Profile Name"
}

variable "vpc_id"{
    type = string
    description = "VPC details"
}

variable "vpc_subnet_id" {
    type = string
    description = "Subnet Id for instance launch"
}

variable "key_name"{
    type = string
    description = "Instance Key Pair Name attached with the instance"
}

variable "image_id"{
    type = string
    description = "AMI Id for the EC2 Instance"
    default = "ami-052c08d70def0ac62"
    /*
    validation {
        # regex(...) fails if it cannot find a match
        condition     = can(regex("^ami-", var.image_id))
        error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
    }
    */
}

variable "instance_type"{
    type = string
    description = "Instance Type of the Web Server"
}


variable "user_name" {
    type        = string
    description = "The login user for SSH connection"
    default     = "ec2-user" 
}

variable "connection_type" {
    type        = string
    description = "Connection type for remote login"
    default     = "ssh"
}


variable "image_s3_bucket_name" {
        type        = string
	description = "Unique Bucket Name for Images"
}

variable "image_s3_bucket_acl" {
        type = string
        default = "private"
	description = "S3 images Bucket ACL"
}

variable "image_s3_force_destroy_bucket" {
        type = bool
        default = true
        description = "Parmater indicates that the objects from the bucket to be deleted, so that bucket can be destroyed without error"
}


## Cloudfront Module Variables

variable "bucket_origin_id"{
        type = string
        description = "Name of S3 Cloudfront Origin "
}


variable "cache_allowed_methods" {
        type = list(string)
        default = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
        description = "List of allowed methods for AWS CloudFront"
}

variable "cached_methods" {
        type = list(string)
        default = ["GET", "HEAD"]
        description = "List of cached methods (e.g. GET, PUT, POST, DELETE, HEAD)"
}

variable "default_ttl" {
  type        = number
  default     = 60
  description = "Default amount of time (in seconds) that an object is in a CloudFront cache"
}

variable "min_ttl" {
  type        = number
  default     = 0
  description = "Minimum amount of time that you want objects to stay in CloudFront caches"
}

variable "max_ttl" {
  type        = number
  default     = 31536000
  description = "Maximum amount of time (in seconds) that an object is in a CloudFront cache"
}


variable "wait_for_deployment" {
  type        = bool
  default     = true
  description = "When set to 'true' the resource will wait for the distribution status to change from InProgress to Deployed"
}


variable "viewer_protocol_policy" {
  type        = string
  description = "allow-all, redirect-to-https"
  default     = "redirect-to-https"
}

variable "price_class" {
  type        = string
  default     = "PriceClass_All"
  description = "PriceClass_All, PriceClass_200, PriceClass_100"
}

variable "geo_restriction_type" {
  type = string
  default     = "none"
  description = "Method that use to restrict distribution of your content by country: `none`, `whitelist`, or `blacklist`"
}

variable "geo_restriction_locations" {
  type = list(string)

  # e.g. ["US", "CA", "GB", "DE"]
  default     = []
  description = "List of country codes for which  CloudFront either to distribute content (whitelist) or not distribute your content (blacklist)"
}

variable "enabled"{
        type = bool
        default = true
}

variable "ipv6_enabled" {
        type = bool
        default = true
}

variable "compression_objects_enable" {
        type = bool
        default = true
        description = "Parameter for compression of content served using Cloudfront Distribution for web requests"

}









