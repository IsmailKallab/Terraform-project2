## Vpc Cidr Block
variable "vpc_cidr_block" {
  type        = string
  description = "The IP range to use for the Project1 VPC"
  default     = "10.0.0.0/16"
}

## Spicify AWS Region
variable "region" {
  default = "us-east-1"
}

## aviability zone for us-east-1 region to assign 
variable "availability_zones" {
  type        = list(any)
  description = "AZs in this region to use"
  default     = ["us-east-1a", "us-east-1b"]

}

## cidr block for public subnet
variable "subnet_cidrs_public" {
  type        = list(any)
  description = "Subnet CIDRs for public subnets (length must match configured availability_zones)"
  default     = ["10.0.10.0/24", "10.0.20.0/24"]

}

## Allow all traffic 
variable "all_trafic_cidr_block" {
  default     = "0.0.0.0/0"
  description = "Allow all traffic"

}

# Amazon Linux 2023 AMI in us-east-1
variable "ami" {
  default = "ami-05c13eab67c5d8861" # Amazon Linux 2023 AMI
}

# type of ec2 instance
variable "instance_type" {
  default = "t2.micro"
}

# key-pair 
variable "key_name" {
  default = "mkN.V"

}

variable "instance_name" {
  type = list(any)
  default = [ "instance-1","instance-2" ]
  
}