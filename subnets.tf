resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  for_each = var.PUBLIC_SUBNETS
  cidr_block = each.value["cidr"]
  availability_zone= each.value["az"]
  map_public_ip_on_launch= true
  tags = {
    Name = "${each.key}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main.id
  for_each = var.PRIVATE_SUBNETS
  cidr_block = each.value["cidr"]
  availability_zone=each.value["az"]
  tags = {
    Name = "${each.key}"
  }
}