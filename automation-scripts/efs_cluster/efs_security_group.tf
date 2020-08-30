## Security Group for EFS Cluster
resource "aws_security_group" "efs_security_group"{
	name = "allow_nfs_traffic"
	description = "Allow NFS Server Port Traffic from VPC"
	vpc_id = var.vpc_id

	ingress {
		description = "NFS Port"
		from_port = 2049
		to_port = 2049
		protocol = "tcp"
		cidr_blocks = [var.vpc_cidr_block]
	}
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

