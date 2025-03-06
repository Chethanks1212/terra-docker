variable "AK" {
    type = string
}
variable "SK" {
    type = string
}


provider "aws" {
  region     = "ap-south-1"
  access_key = var.AK
  secret_key = var.SK
}

resource "aws_instance" "example_1" {
  ami           = "ami-0f2ce9ce760bd7133"
  instance_type = "t2.small"
  key_name      = "chethanks_1212"
  tags = {
    Name = "worker"
  }
  security_groups = [aws_security_group.example_sg.name]
}
resource "aws_instance" "example_2" {
  ami           = "ami-0f2ce9ce760bd7133"
  instance_type = "t2.small"
  key_name      = "chethanks_1212"
  tags = {
    Name = "worker"
  }
  security_groups = [aws_security_group.example_sg.name]
}
resource "aws_security_group" "example_sg" {
  tags = {
    Name = "secyrityGroup"
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "private_ip" {
  value = aws_instance.example_1.private_ip

}
output "private_ipp" {
  value = aws_instance.example_2.private_ip

}
