output "developer_vm_instance_id" {
  description = "ID of the InfraPro developer VM"
  value       = module.compute.instance_id
}

output "developer_vm_public_ip" {
  description = "Public IP address of the InfraPro developer VM"
  value       = module.compute.public_ip
}

output "developer_vm_private_ip" {
  description = "Private IP address of the InfraPro developer VM"
  value       = module.compute.private_ip
}

output "developer_vm_key_name" {
  description = "SSH key pair name used by the developer VM"
  value       = module.compute.key_name
}
