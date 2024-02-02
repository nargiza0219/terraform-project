output "public_subnet1" {
  value = aws_subnet.public_subnet1.id
}

output "main_vpc_id" {
  value = aws_vpc.main_vpc.id
}
