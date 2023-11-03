######################################################
#                                                    #  
#   DEPLOYING A JENKINS SERVER ON AWS EC2 INSTANCE   # 
#                                                    #
######################################################

# ------------------------------------------------------------------------------
# CREATE A VPV WITH CIDR_BLOCK : 10.0.0.0/16
# ------------------------------------------------------------------------------

resource "aws_vpc" "Project2" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "Project2"
  }
}


# ------------------------------------------------------------------------------
# CREATE PUBLIC SUBNET IN US-EAST-1A & US-EAST-1B
# ------------------------------------------------------------------------------

# create public subnet using Length function depend on subnet_cirs_public variable numbers

resource "aws_subnet" "public" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.Project2.id
  cidr_block        = var.subnet_cidrs_public[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "Public_Subnet-${count.index + 1}"
  }

}


# create route table for vpc "project 2" 

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.Project2.id

  # route the tarffic to the internet for two buplic subnet 
  route {
    cidr_block = var.all_trafic_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public_route"
  }
}

resource "aws_main_route_table_association" "default_route" {
  vpc_id         = aws_vpc.Project2.id
  route_table_id = aws_route_table.public.id
}

# associate route table to eache subnet

resource "aws_route_table_association" "public" {
  count = length(var.subnet_cidrs_public)

  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id

}

# attached internet gatewat to a project vpc for aws_route_table_public 

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.Project2.id
  tags = {
    Name = "public_subnet_internet"
  }
}

#-------------------------------------------
# Recall EC2 Security Group Module 
#-------------------------------------------
module "ec2_sg" {
  source = "./module/EC2SG"
  name   = "ec2_sg"
  vpc_id = aws_vpc.Project2.id


}

# -----------------------------------------------------------------------------------
# CREATE ELASTIC IP FOR TWO PUBLIC INSTANCE
# -----------------------------------------------------------------------------------
#

resource "aws_eip" "ec2_eips" {
  count = 2
  vpc   = true
  tags = {
    Name = "EC2_eip-${count.index + 1}"
  }
}
resource "aws_eip_association" "eip_assoc" {
  count = 2
  instance_id   = aws_instance.Jenkins[count.index].id
  allocation_id = aws_eip.ec2_eips[count.index].id
}
