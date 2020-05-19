# vpc.tf 

# Create VPC/Subnet/Security Group/Network ACL
provider "aws" {
  version = "~> 2.0"
  access_key = var.access_key 
  secret_key = var.secret_key 
  region     = var.region
}
# create the VPC
resource "aws_vpc" "My_VPC" {
  cidr_block           = var.vpcCIDRblock
  instance_tenancy     = var.instanceTenancy 
  enable_dns_support   = var.dnsSupport 
  enable_dns_hostnames = var.dnsHostNames
tags = {
    Name = "My VPC"
}
} # end resource
# create the Subnet
resource "aws_subnet" "My_VPC_Subnet" {
  vpc_id                  = aws_vpc.My_VPC.id
  cidr_block              = var.subnetCIDRblock
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone
tags = {
   Name = "My VPC Subnet"
}
} # end resource
# Create the Security Group
resource "aws_security_group" "My_VPC_Security_Group" {
  vpc_id       = aws_vpc.My_VPC.id
  name         = "My VPC Security Group"
  description  = "My VPC Security Group"
  
 ingress {
        protocol = "tcp"
        from_port   = "1433"
        to_port     = "1433"
        cidr_blocks = ["18.223.240.65/32"]
}

ingress {
        protocol = "tcp"
        from_port   = "9000"
        to_port     = "9000"
        cidr_blocks = ["18.223.240.65/32"]
}

ingress {
        protocol = "tcp"
        from_port   = "8080"
        to_port     = "8080"
        cidr_blocks = ["18.223.240.65/32"]
}

ingress {
        from_port = "80"
        to_port = "80"
        protocol = "tcp"
        cidr_blocks = ["18.223.240.65/32"]
}

ingress {
        from_port = "4200"
        to_port = "4200"
        protocol = "tcp"
        cidr_blocks = ["18.223.240.65/32"]
}
ingress {
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["18.223.240.65/32"]
}

ingress {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_blocks = ["18.223.240.65/32"]

} 
  
  # allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
   Name = "My VPC Security Group"
   Description = "My VPC Security Group"
}
} # end resource
# start aws_instance resource
resource "aws_instance" "terraform-server-V1" {
  ami  = "${var.ami_id}" 
  instance_type = "${var.ec2_instance_type}"
  availability_zone = "${var.availabilityZone}"
  security_groups = ["${aws_security_group.My_VPC_Security_Group.id}"]
  subnet_id = aws_subnet.My_VPC_Subnet.id
  key_name = "tracrat-dev"
  tags = {
      Name = "terraform-server"
   }
 }
# end aws_instance resource
# end vpc.tf