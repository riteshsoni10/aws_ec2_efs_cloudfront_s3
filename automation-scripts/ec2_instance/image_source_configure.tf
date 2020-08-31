
# Configure Website to use CDN domain as images source
resource "null_resource" "configure_image_url" {
        depends_on = [
                null_resource.application_deployment,
        ]
        connection{
                type = var.connection_type
                host = aws_instance.web_server.public_ip
                user  = var.connection_user
                private_key = file(var.instance_key_name)
        }
        provisioner remote-exec {
                inline =[
                        "grep -rli 'images' /var/www/html/* | sudo xargs sudo sed -i 's+images+https://${var.cdn_dns_name}+g' "
                ]
        }
}
