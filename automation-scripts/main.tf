provider "aws"{
    region = var.region_name
    profile = var.user_profile
}

module "efs" {
    source         = "./efs_cluster"
    vpc_id         = var.vpc_id
    subnet_ids     = data.aws_subnet_ids.vpc_details.ids
    vpc_cidr_block = data.aws_vpc.vpc_details.cidr_block
}

module "instance_launch" {
    source                = "./ec2_instance"
    instance_key_name     = var.key_name
    vpc_id                = var.vpc_id
    instance_subnet_id    = var.vpc_subnet_id
    ami_id                = var.image_id
    instance_type         = var.instance_type
    connection_user       = var.user_name
    connection_type       = var.connection_type
    efs_cluster_dns_name  = module.efs.efs_cluster_dns_name
    cdn_dns_name          = module.image_cdn_configure.cdn_dns_name
}


module "images_bucket"{
	source = "./s3_bucket"
	bucket_name= var.image_s3_bucket_name 
	bucket_acl = var.image_s3_bucket_acl	
	force_destroy_bucket = var.image_s3_force_destroy_bucket	
}


module "image_cdn_configure" {
	source = "./cloudfront"
	image_source_domain_name = module.images_bucket.image_source_domain_name
	s3_origin_id = var.bucket_origin_id
	enabled      = var.enabled
}

