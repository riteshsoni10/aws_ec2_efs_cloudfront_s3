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


