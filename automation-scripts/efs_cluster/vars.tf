variable "vpc_cidr_block"{
    type = string
    Description = "CIDR Block for the EFS Cluster"
}

variable "subnet_ids"{
    type = list<string>
    Description = "List of Subnet Ids "
}