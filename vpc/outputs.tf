output "vpc_id" {
  value = aws_vpc.main.id
}
output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}
output "private_app_subnet_id" {
  value = aws_subnet.private_app_subnet.id
}
output "private_db_subnet_id" {
  value = aws_subnet.private_db_subnet.id
}
output "private_db_subnet2_id" {
  value = aws_subnet.private_db_subnet2.id
}
output "public_subnet2_id" {
  value = aws_subnet.public_subnet2.id
}