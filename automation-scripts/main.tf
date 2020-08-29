provider "aws"{
    region = var.region_name
    profile = var.profile_name
}

module "efs" {
    source = "./efs_cluster"
    data.aws_subnet_ids.vpc_details.ids
    data.aws_vpc.vpc_details.cidr_block
}