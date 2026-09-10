resource "terraform_data" "ansible_config" {
  triggers_replace = [
    module.compute.instance_id
  ]

  provisioner "local-exec" {
    command = <<-EOT
      set -e

      ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook \
        -i "developer," \
        -u ubuntu \
        --private-key "${pathexpand(var.private_key_path)}" \
        -e "ansible_host=${module.compute.public_ip}" \
        "${path.root}/../ansible/playbook.yml"
    EOT
  }
}