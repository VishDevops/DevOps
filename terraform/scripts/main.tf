provider "aws" {
profile    = "default"
region     = "us-east-2c"
access_key = "XXX"
secret_key = "XXX"
}



resource "aws_instance" "example" {
  ami  = "XXX"
  instance_type = "t2.micro"
}

