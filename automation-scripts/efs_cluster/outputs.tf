output "efs_cluster_dns_name" {
    value = aws_efs_file_system.nfs_server.dns_name
}


output "cluster_id"{
    value = aws_efs_file_system.nfs_server.id
}


output "security_group_id"{
	value = aws_security_group.efs_security_group.id
}
