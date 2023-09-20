resource "aws_instance" "web-server" {
  disable_api_termination     = true
  # for_each                    = { for instance in var.instance_details : instance.instance_name => instance }
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.generated_key.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids 
  root_block_device {
    volume_size               = var.root_block_volume_size
    delete_on_termination     = var.boot_disk_delete_on_termination
  }

  user_data = var.is_os_linux ? templatefile("${path.module}/linux_startup_script.tpl", {}) : templatefile("${path.module}/windows_startup_script.tpl", {})
    lifecycle {
    ignore_changes = [tags]
  }

}

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4690
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.key.public_key_openssh
    lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_secretsmanager_secret" "secret_key" {
  name_prefix = var.name_prefix
    lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_secretsmanager_secret_version" "secret_key_value" {
  secret_id= aws_secretsmanager_secret.secret_key.id
  secret_string = tls_private_key.key.private_key_pem
}
