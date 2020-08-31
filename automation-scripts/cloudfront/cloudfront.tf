
#Creating Origin Access Identity
resource "aws_cloudfront_origin_access_identity" "s3_objects" {
        comment = "S3-Image-Source"
}

# Creating CloudFront Distribution for Images source from S3 Bucket
resource "aws_cloudfront_distribution" "image_distribution" {
        origin {
                domain_name      = var.image_source_domain_name
                origin_id        = var.s3_origin_id
                s3_origin_config {
                        origin_access_identity = aws_cloudfront_origin_access_identity.s3_objects.cloudfront_access_identity_path
                }
        }
        enabled = var.enabled
        is_ipv6_enabled = var.ipv6_enabled
        default_cache_behavior {
                allowed_methods  = var.cache_allowed_methods
                cached_methods   = var.cached_methods
                target_origin_id = var.s3_origin_id
                forwarded_values {
                        query_string = false
                        cookies {
                                forward = "none"
                        }
                }
                viewer_protocol_policy =  var.viewer_protocol_policy
                min_ttl                = var.min_ttl
                default_ttl            = var.default_ttl
                max_ttl                = var.max_ttl
                compress               = var.compression_objects_enable
        }
        wait_for_deployment = var.wait_for_deployment
        price_class = var.price_class
        restrictions {
                geo_restriction {
                        restriction_type = var.geo_restriction_type
                        locations        = var.geo_restriction_locations
                }
        }
        tags = {
                Environment = "test-Environment"
        }
        viewer_certificate {
                 cloudfront_default_certificate = true
        }
}
