variable "region_name" {
    type = string
    description = "Region Name"
}

variable "user_profile" {
    type = string   
    description = "AWS Profile Name"
}

variable "vpc_id"{
    type = string
    description = "VPC details"
}

variable "key_name"{
    type = string
    description = "Instance Key Pair Name attached with the instance"
}

variable "image_id"{
    type = string
    description = "AMI Id for the EC2 Instance"
    default = "ami-052c08d70def0ac62"
    /*
    validation {
        # regex(...) fails if it cannot find a match
        condition     = can(regex("^ami-", var.image_id))
        error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
    }
    */
}


variable "user_name" {
    type        = string
    description = "The login user for SSH connection"
    default     = "ec2-user" 
}

variable "connection_type" {
    type        = string
    description = "Connection type for remote login"
    default     = "ssh"
}

