resource "aws_subnet" "management_subnet" {
  vpc_id     = aws_vpc.your_vpc.id
  cidr_block = var.subnet_cidrs[0]
  availability_zone = var.az[0]
  map_public_ip_on_launch =  true
  tags = {
    Name = "management-subnet"
  }
}
resource "aws_subnet" "restricted_subnet" {
  
  vpc_id = aws_vpc.your_vpc.id
  cidr_block = var.subnet_cidrs[1]
  availability_zone = var.az[1]
  tags = {
    Name = "restricted-subnet"
  }
}


# resource "aws_subnet" "public_subnet" {
#   vpc_id            = aws_vpc.your_vpc.id
#   cidr_block        = var.subnet_cidrs[0]
#   availability_zone = var.az[0]
#   map_public_ip_on_launch =  true
#   tags = {
#     Name = "tf-public-subnet1"
#   }
# }




# resource "aws_subnet" "private_subnet" {
#   vpc_id            = aws_vpc.your_vpc.id
#   cidr_block        = var.subnet_cidrs[1]
#   availability_zone = var.az[1]

#   tags = {
#     Name = "tf-private-subnet1"
#   }
# }
