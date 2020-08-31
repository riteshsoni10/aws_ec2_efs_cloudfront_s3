variable "image_source_domain_name"{
	type = string
	description = "DNS regionla nam of S3 Bucket"
}


variable "s3_origin_id"{
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
