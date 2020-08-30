output "efs_cluster_dns_name" {
    value = aws_efs_file_system.nfs_server.dns_name
}