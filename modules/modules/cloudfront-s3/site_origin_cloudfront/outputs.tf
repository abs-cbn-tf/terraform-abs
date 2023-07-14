output "bucket_id" {
  value = aws_s3_bucket.site_origin.id
}

output "bucket_domain_name" {
  value = aws_s3_bucket.site_origin.bucket_domain_name
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.site_access.domain_name
}

