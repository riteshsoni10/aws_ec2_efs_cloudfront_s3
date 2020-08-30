resource "aws_instance" "web_server"{
    ami       = var.ami_id
    instance_type      = var.instance_type
    key_name  = aws_key_pair.create_instance_key_pair.key_name
    security_groups = [ aws_security_group.instance_security_group.name ]
    tags = {
        Name = "Web-Server"
    }
}
/*
resource  "null_resource" "invoke_playbook"{
    depends_on = [
        aws_volume_attachment.ec2_volume_attach,
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
        command = "ansible-playbook -u ${var.connection_user} -i ${aws_instance.web_server.public_ip}, --private-key ${var.instance_key_name} ../deployment_scripts/configuration.yml  --ssh-extra-args=\"-o stricthostkeychecking=no\""
    }
}
*/