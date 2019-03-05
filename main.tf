provider "aws" {
  region = "ca-central-1"
profile = ""

}
resource "aws_instance" "" {
  ami = "ami-0f0dee68e2d149576"
  instance_type = "t2.medium"
  key_name = ""
  vpc_security_group_ids = ["${aws_security_group.Web.id}"]
  
tags {
 Name = ""
}
}
resource "aws_security_group" "Web" {
  name = ""
  vpc_id = ""

  # Internal HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Internal HTTPS access from anywhere
  ingress {
    from_port   = 443   
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  #ssh from anywhere (unnecessary)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # ping access from anywhere   
  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = ""
  }
}



