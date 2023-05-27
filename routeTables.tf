resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id
  route {
    #Destination
    cidr_block = "0.0.0.0/0"
    #Target
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.NAME}-public-rtb"
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.main.id
    tags = {
    Name = "${var.NAME}-private-rtb"
  }
}