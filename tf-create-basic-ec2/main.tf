# Create EC2 instance
# Where to create - provide cloud provider name
# Which region to create in
# What resource to create
# What AMI to use
#   Ubuntu 22.04: ami-0c1c30571d2dae5c9
# Instance type: t3.micro
# Add a public IP address
# Name instance
# syntax for HCL is {key = value}

provider "aws" {
  region = var.app_region
}

# Terraform changes frequently so the official documentation is good

resource "aws_instance" "app_instance" {
  ami = var.app_ami_id
  instance_type = var.app_instance_type
  associate_public_ip_address = var.app_public_ip
  tags = {
    Name = var.app_name
  }
}