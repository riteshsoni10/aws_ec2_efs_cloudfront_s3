resource "tls_private_key" "instance_key"{
    algorithm = "RSA"
}

resource "aws_key_pair" "create_instance_key_pair"{
    key_name   = var.instance_key_name
    public_key = tls_private_key.instance_key.public_key_openssh

    depends_on = [
        tls_private_key.instance_key
    ]
}

