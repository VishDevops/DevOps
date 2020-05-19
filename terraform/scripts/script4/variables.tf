# variables.tf
variable "access_key" {
     default = "XXXX"
}
variable "secret_key" {
     default = "XXXXX"
}
variable "region" {
     default = "us-east-2"
}
variable "ami_id" {
  default = "ami-07c1207a9d40bc3bd"
}
variable "ec2_instance_type" {
  default = "t2.micro"
}
variable "availabilityZone" {
     default = "us-east-2a"
}
variable "instanceTenancy" {
    default = "default"
}
variable "dnsSupport" {
    default = true
}
variable "dnsHostNames" {
    default = true
}
variable "vpcCIDRblock" {
    default = "10.0.0.0/16"
}
variable "subnetCIDRblock" {
    default = "10.0.1.0/24"
}
variable "destinationCIDRblock" {
    default = "0.0.0.0/0"
}
variable "ingressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "egressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "mapPublicIP" {
    default = true
}
# end of variables.tf