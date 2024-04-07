########### EC2 ##################

variable "ec2_ami_id" {
}
variable "ec2_instance_type" {
}
variable "script" {
}
variable "ec2_name" {
}
variable "jump_server_name" {
}

########### NETWORKING ##########

variable "ec2_sg_name" {
}
variable "ec2_sg_desc" {
}
variable "rds_sg_name" {
}
variable "rds_sg_desc" {
}
variable "tg_name" {
}
variable "lb_name" {
}

########### RDS #################

variable "instance_class" {
}
variable "rds_name" {
}
variable "engine" {
}
variable "parameter_group_name" {
}
variable "engine_version" {
}
variable "master_username" {
}
variable "master_password" {
}
variable "rds_port" {
}
variable "rds_storage" {
}


########### VPC ##################

variable "vpc_cidr" {
}
variable "public_cidr" {
}
variable "vpc_az" {
}
variable "private_app_cidr" {
}
variable "private_db_cidr" {
}
variable "private_db2_cidr" {
}
variable "public2_cidr" {
}