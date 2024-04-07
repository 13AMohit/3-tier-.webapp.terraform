vpc_cidr         = "172.20.0.0/20"
vpc_az           = "ap-south-1a"
public_cidr      = "172.20.1.0/24"
private_app_cidr = "172.20.2.0/24"
private_db_cidr  = "172.20.3.0/24"
private_db2_cidr = "172.20.4.0/24"
public2_cidr     = "172.20.5.0/24"

ec2_sg_name = "dev-ec2-security-group"
ec2_sg_desc = "Security group for dev EC2 instances"
rds_sg_name = "rds-security-group"
rds_sg_desc = "Security group of RDS instance"
tg_name     = "wordpress-tg"
lb_name     = "wordpress-lb"



ec2_ami_id        = "ami-007020fd9c84e18c7"
ec2_instance_type = "t3.small"
script            = "dev-script.sh"
ec2_name          = "dev-instance"
jump_server_name  = "jump_server"

instance_class       = "db.t3.micro"
rds_name             = "beztlab-test"
engine               = "postgres"
parameter_group_name = "default.postgres-16"
engine_version       = "16.1"
master_username      = "beztlabrds"
master_password      = "beztlabrds"
rds_port             = 5432
rds_storage          = 20