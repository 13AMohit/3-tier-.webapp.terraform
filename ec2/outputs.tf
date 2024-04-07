output "ec2_id" {
  value = aws_instance.ec2_instance.arn
}
output "ec2_instance_id" {
  value = aws_instance.ec2_instance.id
}

output "jump_server_id" {
  value = aws_instance.jump-server.public_ip
}