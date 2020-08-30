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