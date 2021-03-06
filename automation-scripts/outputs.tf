output "instance_key_name"{
         value = module.instance_launch.key_name
}

output "security_group_id" {
        value = module.instance_launch.security_group_id
}

output "ec2_instance_public_ip"{
        value = module.instance_launch.public_ip
}

output "efs_cluster_dns_name" {
        value = module.efs.efs_cluster_dns_name
}

output "efs_cluster_id"{
        value = module.efs.cluster_id
}

output "efs_security_group_id"{
        value = module.efs.security_group_id
}

         
output "s3_bucket_domain_name"{
        value = module.images_bucket.image_source_domain_name
}


output "cloudfront_id" {
         value = module.image_cdn_configure.cf_id
}

output "cloudfront_status" {
         value  = module.image_cdn_configure.cf_status
}

output "coudfront_domain_name" {
         value = module.image_cdn_configure.cdn_dns_name
}
