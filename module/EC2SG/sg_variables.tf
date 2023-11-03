variable "name" {
    type = string
  description = "WebSG"
}



variable "ingress_rules" {
  default = [{
    from_port   = 8080
    to_port     = 8080
    description = "Port 8080 for Jenkins"
    cidr_block = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      description = "Port 80"
      cidr_block = "0.0.0.0/0"
    },
    {
      from_port   = 22
      to_port     = 22
      description = "Port 22"
      cidr_block = "0.0.0.0/0"
    }

  ]
}

variable "egress_rules" {
  default = [{
    from_port   = "0"
    to_port     = "0"
    protocol = "-1"
    description = "Allow All Outbound Traffic"
    cidr_block = "0.0.0.0/0"
    }
  ]
}

variable "vpc_id" {

  type = string

}

