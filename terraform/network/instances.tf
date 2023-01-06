# resource "aws_instance" "public_server" {
#   ami           = "ami-08e637cea2f053dfa"
#   instance_type = "t2.micro"
#   tags = {
#    Name = "public_server"
#  }
#   # VPC
#   subnet_id = aws_subnet.public_subnet.id
#   # Security Group
#   vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
#   # the Public SSH key
#   key_name = aws_key_pair.my_key.id
# #   nginx installation
# #   storing the nginx.sh file in the EC2 instnace
#   provisioner "file" {
#     source      = "/home/dev97/Desktop/finalproject/terraform/network/nginx.sh"
#     destination = "/tmp/nginx.sh"
#   }

#   # Setting up the ssh connection to install the nginx server
#   # Exicuting the nginx.sh file
#   # Terraform does not reccomend this method becuase Terraform state file cannot track what the scrip is provissioning
#   provisioner "remote-exec" {
#     inline = [
#       "sudo chmod +x /tmp/nginx.sh",
#       "sudo /tmp/nginx.sh"
#     ]
#   }

#   connection {
#     type        = "ssh"
#     host        = self.public_ip
#     user        = "ec2-user"
#     private_key = file("${"/home/dev97/.ssh/id_rsa"}")
#   }
#   }


#   resource "aws_instance" "pv_server" {
#   ami           = "ami-08e637cea2f053dfa"
#   instance_type = "t2.micro"
#   tags = {
#    Name = "pv_server"
#  }
#   # VPC
#   subnet_id = aws_subnet.private_subnet.id
#   # Security Group
#   vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
#   # the Public SSH key
#   key_name = aws_key_pair.my_key.id
# #   nginx installation
# #   storing the nginx.sh file in the EC2 instnace
#   provisioner "file" {
#     source      = "/home/dev97/Desktop/finalproject/terraform/network/nginx2.sh"
#     destination = "/tmp/nginx2.sh"
#   }

#   # Setting up the ssh connection to install the nginx server
#   # Exicuting the nginx.sh file
#   # Terraform does not reccomend this method becuase Terraform state file cannot track what the scrip is provissioning
#   provisioner "remote-exec" {
#     inline = [
#       "sudo chmod +x /tmp/nginx2.sh",
#       "sudo /tmp/nginx2.sh"
#     ]
#   }


#     connection {
#     type        = "ssh"
#     host        = self.private_ip
#     user        = "ec2-user"
#     private_key = file("${"/home/dev97/.ssh/id_rsa"}")
#   }
#   }




resource "aws_instance" "management_server" {
  ami           = "ami-08e637cea2f053dfa"
  instance_type = "t2.micro"
  tags = {
   Name = "management_server"
 }
  # VPC
  subnet_id = aws_subnet.management_subnet.id
  # Security Group
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  # the Public SSH key
  key_name = aws_key_pair.my_key.id
#   nginx installation
#   storing the nginx.sh file in the EC2 instnace
  provisioner "file" {
    source      = "/home/dev97/Desktop/finalproject/terraform/network/nginx.sh"
    destination = "/tmp/nginx.sh"
  }

  # Setting up the ssh connection to install the nginx server
  # Exicuting the nginx.sh file
  # Terraform does not reccomend this method becuase Terraform state file cannot track what the scrip is provissioning
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/nginx.sh",
      "sudo /tmp/nginx.sh"
    ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("${"/home/dev97/.ssh/id_rsa"}")
  }
  }