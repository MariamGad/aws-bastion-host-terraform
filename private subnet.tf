resource "aws_subnet" "pri_sub1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone= "us-east-1a"

  tags = {
    Name = "private_subnet1"
  }
}