resource "aws_key_pair" "my_key" {
  key_name   = "eks-test"
  public_key = tls_private_key.pk.public_key_openssh
  provisioner "local-exec" { # Create a "eks-test.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./eks-test.pem"
  }
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}