provider "aws"{
    region = var.region_name
    profile = var.user_profile
}
/*
module "efs" {
    source         = "./efs_cluster"
    vpc_id         = var.vpc_id
    subnet_ids     = data.aws_subnet_ids.vpc_details.ids
    vpc_cidr_block = data.aws_vpc.vpc_details.cidr_block
}
*/
module "instance_launch" {
    source = "./ec2_instance"
    instance_key_name = var.key_name
    vpc_id         = var.vpc_id
    ami_id         = var.image_id
    depends_on = [
        module.efs
    ]
}