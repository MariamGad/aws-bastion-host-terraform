# attach public subnet with public route table 
resource "aws_route_table_association" "pub_assoc" {
  subnet_id      = aws_subnet.pub_sub1.id
  route_table_id = aws_route_table.public_route.id
}

# attach private subnet with private route table 
resource "aws_route_table_association" "pri_assoc" {
  subnet_id      = aws_subnet.pri_sub1.id
  route_table_id = aws_route_table.private_route.id
}