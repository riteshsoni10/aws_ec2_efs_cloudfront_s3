## Generating SSH-Key pair
resource "tls_private_key" "instance_key"{
    algorithm = "RSA"
}

## Creating AWS Instance Key-Pair using SSH-Key generated
resource "aws_key_pair" "create_instance_key_pair" {
    key_name   = var.instance_key_name
    public_key = tls_private_key.instance_key.public_key_openssh

    depends_on = [
        tls_private_key.instance_key
    ]
}

## Saving Private Key for SSH Login in pem Format
resource "local_file" "store_instance_key"{
    content = tls_private_key.instance_key.private_key_pem
    filename = var.instance_key_name
    file_permission = "0400"
    depends_on = [
        tls_private_key.instance_key
    ]
}
