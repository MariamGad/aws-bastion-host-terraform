resource "aws_security_group" "allow_ssh"{
    name        = "${var.NAME}_allow_ssh"
    vpc_id      = aws_vpc.main.id
    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks=["0.0.0.0/0"]
    }
}

resource "aws_security_group" "private_ssh"{
    name        = "${var.NAME}_private_ssh"
    vpc_id      = aws_vpc.main.id
    ingress {
        description      = "SSH from VPC"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks=[aws_vpc.main.cidr_block]
    }
}