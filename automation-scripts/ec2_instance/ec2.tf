resource "aws_instance" "web_server"{
    ami                         = var.ami_id
    subnet_id                   = var.instance_subnet_id
    instance_type               = var.instance_type
    key_name                    = aws_key_pair.create_instance_key_pair.key_name
    associate_public_ip_address = true
    vpc_security_group_ids      = [ aws_security_group.instance_security_group.id ]
    tags = {
        Name = "Web-Server"
    }
}

resource  "null_resource" "application_deployment"{
    depends_on = [
        aws_instance.web_server,

    ]

    connection{
        type = var.connection_type
        host = aws_instance.web_server.public_ip
        user  = var.connection_user
        private_key = file(var.instance_key_name)
    }

    provisioner remote-exec {
        inline =[
            "sudo yum install python36 -y"
        ]
    }

    provisioner local-exec {
        command = "ansible-playbook -u ${var.connection_user} -i ${aws_instance.web_server.public_ip}, --private-key ${var.instance_key_name} deployment_scripts/configuration.yml -e efs_cluster_dns_name=${var.efs_cluster_dns_name} --ssh-extra-args=\"-o stricthostkeychecking=no\""
    }
}



