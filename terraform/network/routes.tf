
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.your_vpc.id

  tags = {
    name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_ass_routetable" {
  
 route_table_id = aws_route_table.public_route_table.id
 subnet_id = aws_subnet.management_subnet.id

}



#######igw###################

resource "aws_route" "igw_route" {

    route_table_id = aws_route_table.public_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  

}





###################p1##################################


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.your_vpc.id

  tags = {
    name = "private-route-table"
  }
}

resource "aws_route_table_association" "private_ass_routetable" {
  
 route_table_id = aws_route_table.private_route_table.id
 subnet_id = aws_subnet.restricted_subnet.id

}




#############natgw###################

resource "aws_route" "nat_route" {

    route_table_id = aws_route_table.private_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_public.id
  
depends_on = [
  aws_nat_gateway.nat_public
]
}


