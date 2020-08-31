output "cdn_dns_name" {
	value = aws_cloudfront_distribution.image_distribution.domain_name
}
