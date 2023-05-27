# attach public subnet with public route table 
resource "aws_route_table_association" "pub_assoc" {
  for_each = aws_subnet.public_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_route.id
}

# attach private subnet with private route table 
resource "aws_route_table_association" "pri_assoc" {
  for_each = aws_subnet.private_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_route.id
}