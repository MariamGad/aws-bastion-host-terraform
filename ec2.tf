# Get AMI information
data "aws_ami" "amazon-linux-2023-ami" {
    most_recent = true
    owners      = ["amazon"]

    filter {
        name="name"
        values = ["al2023-ami-2023.*-x86_64"]
    }
}

resource "aws_instance" "bastion_host" {
    ami = data.aws_ami.amazon-linux-2023-ami.id
    instance_type = "t2.micro"
    for_each = aws_subnet.public_subnet
    subnet_id = each.value.id
    vpc_security_group_ids =[aws_security_group.allow_ssh.id]
    key_name = "aws_keys_pairs"
    tags = {
    Name = "${var.NAME}_${each.key}_bastion"
    }
    depends_on =[tls_private_key.private_key]
    provisioner "file" {
        source      = "tf-key-pair.pem"
        destination = "/home/ec2-user/tf-key-pair.pem"
        
        connection {
        type        = "ssh"
        user        = "ec2-user"
        private_key = tls_private_key.private_key.private_key_pem
        host        = "${self.public_ip}"
        }
    }

}
resource "aws_instance" "application" {
    ami = data.aws_ami.amazon-linux-2023-ami.id
    instance_type = "t2.micro"
    for_each = aws_subnet.private_subnet
    subnet_id = each.value.id
    vpc_security_group_ids =[aws_security_group.private_ssh.id]
    key_name = "aws_keys_pairs"
    tags = {
        Name = "${var.NAME}_${each.key}_app"
    }
}