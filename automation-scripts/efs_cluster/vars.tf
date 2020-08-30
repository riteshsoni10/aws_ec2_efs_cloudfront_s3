variable "vpc_cidr_block"{
    type = string
    description = "CIDR Block for the EFS Cluster"
}

variable "subnet_ids"{
    type = list(string)
    description = "List of Subnet Ids "
}

variable "vpc_id" {
    type = string
    description = "VPC details"
}