output "cdn_dns_name" {
	value = aws_cloudfront_distribution.image_distribution.domain_name
}

output "cf_id" {
  value       = aws_cloudfront_distribution.image_distribution.id
}

output "cf_status" {
  value       = aws_cloudfront_distribution.image_distribution.status
}
