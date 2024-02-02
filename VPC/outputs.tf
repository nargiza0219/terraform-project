output "public_subnet" {
  value = aws_subnet.public_subnet.id
description = "value"
}

output "main_vpc" {
  value = aws_vpc.main_vpc.id
  description = "value"
}
