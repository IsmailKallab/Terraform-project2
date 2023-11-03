resource "aws_instance" "Jenkins" {

  
  ami               = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  key_name          = "ec2_key"
  count             = length(var.availability_zones)
  availability_zone = var.availability_zones[count.index]
  subnet_id         = aws_subnet.public[count.index].id
  security_groups   = [module.ec2_sg.public_sg_id]
  user_data         = file("${path.module}/Jenkins.sh")
 
  tags = {
    Name = "Jenkins-${var.instance_name[count.index]}"
  }
}

#  Create the Jenkins EC2 instance, add the Jenkins installation to its user data and attach to it Elastic IP.
## Create the Key Local and attach to the instance.
resource "aws_key_pair" "MyKey_SSH" {
  key_name   = "ec2_key"
  public_key = file("~/.ssh/ec2_key.pub")
}
# 5B- This data store is holding the most recent ubuntu 20.04 image
data "aws_ami" "ubuntu" {
  most_recent = "true"

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}