output "ec2_sg_id" {
  value = aws_security_group.ec2_security_group.id
}
output "rds_sg_id" {
  value = aws_security_group.rds_security_group.id
}
output "jump_server_sg_id" {
  value = aws_security_group.jump_server_sg.id
}