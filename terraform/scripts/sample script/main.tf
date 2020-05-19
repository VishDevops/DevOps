provider "aws" {
profile    = "default"
region     = "us-east-2"
access_key = "XXXXX"
secret_key = "XXXXXX"
}

resource "aws_instance" "example" {
  ami  = "XXXXX"
  instance_type = "t2.micro"
  key_name = "tracrat-dev"
  tags = {
      Name = "terraform-server"
   }
 }
 
 variable "aws_vpc" {
   default ="XXXXX"
 }
 
 resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${var.aws_vpc}"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

