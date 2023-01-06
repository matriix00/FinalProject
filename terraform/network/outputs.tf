output "vpc_id" {
  value = aws_vpc.your_vpc.id
}

output "management_subnet" {
  value = aws_subnet.management_subnet.id
}


output "restricted_subnet" {
  value = aws_subnet.restricted_subnet.id
}

output "security_groups" {
  value = aws_security_group.scg_lb.id
}

