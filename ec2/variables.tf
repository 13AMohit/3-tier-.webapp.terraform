variable "ami_id" {
  type    = string
  default = "ami-007020fd9c84e18c7"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "key_name" {
  default = "mohit"
}
variable "ec2_sg_id" {
}
variable "script" {
}
variable "ec2_name" {
}
variable "jump_server_name" {
}
variable "jump_server_sg_id" {
}
variable "app_server_subnet_id" {
}
variable "jump_server_subnet_id" {
}
