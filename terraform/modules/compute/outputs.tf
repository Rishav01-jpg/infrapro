output "instance_id" {
  description = "ID of the InfraPro developer VM"
  value       = aws_instance.developer_vm.id
}

output "public_ip" {
  description = "Public IP address of the InfraPro developer VM"
  value       = aws_instance.developer_vm.public_ip
}

output "private_ip" {
  description = "Private IP address of the InfraPro developer VM"
  value       = aws_instance.developer_vm.private_ip
}

output "key_name" {
  description = "Name of the SSH key pair"
  value       = aws_key_pair.developer.key_name
}