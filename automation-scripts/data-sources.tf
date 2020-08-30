data "aws_vpc" "vpc_details" {
  id = var.vpc_id
}


data "aws_subnet_ids" "vpc_details" {
  vpc_id = var.vpc_id
}


