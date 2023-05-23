resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.main.id

    tags = {
    Name = "private-rtb"
  }
}