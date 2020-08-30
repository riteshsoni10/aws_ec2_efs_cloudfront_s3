variable "instance_key_name"{
    type = string
    description = "Instance Key Pair Name attached with the instance"
}

variable "vpc_id"{
    type = string
    description = "VPC details"
}

/*
variable "controller_public_ip"{
    type        = string
    description = "Controller Node Public IP for SSH Whitelisting"
    source      =
}
*/
variable "ami_id"{
    type = string
    description = "AMI Id for the EC2 Instance"
}

variable "connection_user" {
    type = string
    description = "The login user for SSH connection"
}

variable "connection_type" {
    type= string
    description = "Connection type for remote login"
}

variable "efs_cluster_dns_name" {
    type        = string
    description = "EFS cluster DNS Name for Mount Point "
}