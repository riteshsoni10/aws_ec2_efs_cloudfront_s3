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
    source = "./ec2_instance"
    instance_key_name = var.key_name
    vpc_id         = var.vpc_id
    ami_id         = var.image_id
    connection_user = var.user_name
    connection_type = var.connection_type
    efs_cluster_dns_name  = module.efs.efs_cluster_dns_name
}