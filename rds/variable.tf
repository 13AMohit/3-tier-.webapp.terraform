variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}
variable "rds_name" {
  type    = string
  default = "beztlab-db"
}
variable "engine" {
  default = "postgres"
}
variable "parameter_group_name" {
  default = "default.postgres-16"
}
variable "engine_version" {
  default = "12.5"
}
variable "rds_storage" {
}
variable "rds_subnet_id" {
}
variable "ec2_sg" {
}
variable "rds_port" {
}
variable "master_username" {
}
variable "master_password" {
}
variable "rds_vpc" {
}