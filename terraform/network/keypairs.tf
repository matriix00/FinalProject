resource "aws_key_pair" "my_key" {
  key_name   = "newAccount-key"
  public_key = file("/home/dev97/.ssh/id_rsa.pub")

}