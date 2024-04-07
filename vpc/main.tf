resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    "name" : "bezt-labs-vpc"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "internet_gateway_beztlabs"
  }
}

resource "aws_eip" "eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "natgateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet.id
}

#####################################################
################ PUBLIC SUBNET #####################

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_cidr
  availability_zone = var.vpc_az

  tags = {
    Name = "public_subnet"
  }
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public2_cidr
  availability_zone = var.vpc_az2

  tags = {
    Name = "public_subnet2"
  }
}

resource "aws_route_table" "public_route_table2" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table_association" "public_route_table2_association" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table2.id
}

######################################################
################### PRIVATE APP SUBNET ###############

resource "aws_subnet" "private_app_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_app_cidr
  availability_zone = var.vpc_az

  tags = {
    Name = "private_app_subnet"
  }
}

resource "aws_route_table" "private_app_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgateway.id
  }
  tags = {
    Name = "private_app_route_table"
  }
}

resource "aws_route_table_association" "private_app_route_table_association" {
  subnet_id      = aws_subnet.private_app_subnet.id
  route_table_id = aws_route_table.private_app_route_table.id
}

##################################################
################ PRIVATE DB SUBNET ###############

resource "aws_subnet" "private_db_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_db_cidr
  availability_zone = var.vpc_az

  tags = {
    Name = "private_db_subnet"
  }
}

resource "aws_route_table" "private_db_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgateway.id
  }
  tags = {
    Name = "private_db_route_table"
  }
}

resource "aws_route_table_association" "private_db_route_table_association" {
  subnet_id      = aws_subnet.private_db_subnet.id
  route_table_id = aws_route_table.private_db_route_table.id
}

resource "aws_subnet" "private_db_subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_db2_cidr
  availability_zone = var.vpc_az2

  tags = {
    Name = "private_db_subnet2"
  }
}

resource "aws_route_table" "private_db_route_table2" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgateway.id
  }
  tags = {
    Name = "private_db_route_table2"
  }
}

resource "aws_route_table_association" "private_db_route_table_association2" {
  subnet_id      = aws_subnet.private_db_subnet2.id
  route_table_id = aws_route_table.private_db_route_table2.id
}
