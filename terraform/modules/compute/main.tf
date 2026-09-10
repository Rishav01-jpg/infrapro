data "aws_ssm_parameter" "ubuntu_ami" {
  name = "/aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
}

resource "aws_key_pair" "developer" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)

  tags = {
    Name        = "${var.project_name}-${var.environment}-key"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_instance" "developer_vm" {
  ami                         = data.aws_ssm_parameter.ubuntu_ami.value
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = aws_key_pair.developer.key_name
  associate_public_ip_address = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-developer-vm"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Role        = "Developer"
  }
}