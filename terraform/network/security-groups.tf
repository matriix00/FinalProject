resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.your_vpc.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

## bastion

resource "aws_security_group" "allow_ssh_bastion" {
  name        = "allow_ssh_bastion"
  description = "Allow SSH bastion inbound traffic"
  vpc_id      = aws_vpc.your_vpc.id

  ingress {
    description      = "SSH from bastion"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.subnet_cidrs[0]]
  }
  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh_bastion"
  }
}

  resource "aws_security_group" "scg_lb" {
    vpc_id = aws_vpc.your_vpc.id
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  }


  #### onlyyyyyyyyyy allow-mypc ##

  # resource "aws_security_group" "scg_eks" {
  #   name = "only-allow-my-pc"
  #   vpc_id = aws_vpc.your_vpc.id

  # tags = {
  #   Name = "only-allow-my-pc"
  # }
  #   egress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = -1
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # ingress {
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   #change it later to only publc subnet in my vpc
  #   cidr_blocks = ["84.233.126.138/32"]
  # }
  # }