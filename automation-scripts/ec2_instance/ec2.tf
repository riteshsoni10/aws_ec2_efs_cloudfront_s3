resource "aws_instance" "create_instance"{
    ami       = var.ami_id
    type      = var.instance_type
    key_name  = aws_key_pair.create_instance_key_pair.key_name
    security_groups = [ aws_security_group.instance_security_group.name ]
    tags = {
        Name = "Web-Server"
    }
}
