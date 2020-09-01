output "instance_key_name"{
         value = module.instance_launch.key_name
}

output "security_group_id" {
        value = module.instance_launch.security_group_id
}

output "ec2_instance_public_ip"{
        value = module.instance_launch.public_ip
}

