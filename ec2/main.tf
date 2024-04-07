data "template_file" "user_data_template" {
  template = file("${path.module}/${var.script}")
}

resource "aws_instance" "ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.app_server_subnet_id
  security_groups             = ["${var.ec2_sg_id}"]
  key_name                    = var.key_name
  user_data                   = data.template_file.user_data_template.rendered
  associate_public_ip_address = false
  root_block_device {
    volume_type = "gp2"
    volume_size = 12
  }
  tags = {
    Name = var.ec2_name
  }
}

resource "aws_instance" "jump-server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.jump_server_subnet_id
  security_groups             = ["${var.jump_server_sg_id}"]
  associate_public_ip_address = true
  key_name                    = var.key_name

}
