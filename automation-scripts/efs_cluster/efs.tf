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


# EFS Cluster
resource "aws_efs_file_system" "nfs_server" {
  creation_token = "efs-cluster"
  tags = {
    Name = "EFS_Cluster"
  }
}


## EFS Mount Target Subnets
resource "aws_efs_mount_target" "efs_mount_details"{
	count          = length(var.subnet_ids)
	file_system_id = aws_efs_file_system.nfs_server.id
	subnet_id       = tolist(var.subnet_ids)[count.index]
	security_groups = [aws_security_group.efs_security_group.id]
}


