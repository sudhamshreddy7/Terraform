terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 4.0"
   }
 }
}

provider "aws" {
 region = "us-east-2"
}

data "aws_vpc" "default" {
 default = true
}

resource "aws_security_group" "Allows_SSH" {
 name        = "Allows_SSH"
 description = "Allow SSH to server"
 vpc_id      = data.aws_vpc.default.id

ingress {
   description = "HTTPS ingress"
   from_port   = 22
   to_port     = 22
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }

egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}
# Create an EC2 instance
resource "aws_instance" "test_ec2_ubuntu" {
  ami           = "ami-085f9c64a9b75eed5"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.MyKey.key_name
  security_groups = [aws_security_group.Allows_SSH.name]
  count         = 1
  user_data = <<EOF
#!/bin/bash
echo "Setting up the server"
EOF

  tags = {
    Name = "Test_EC2_Ubuntu"
  }
}

resource "aws_instance" "test_ec2_amazon" {
  ami           = "ami-0490fddec0cbeb88b"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.MyKey.key_name
  security_groups = [aws_security_group.Allows_SSH.name]
  count         = 2
  user_data = <<EOF
#!/bin/bash
echo "Setting up the server"
EOF

  tags = {
    Name = "Test_EC2_Amazon"
  }
}

# Create a new SSH key pair in AWS using the public key file
resource "aws_key_pair" "MyKey" {
  key_name   = "MyKey"
  public_key = file("MyKey.pub")
}