output "security_group_id" {
  description = "ID of the developer VM security group"
  value       = aws_security_group.developer_vm.id
}