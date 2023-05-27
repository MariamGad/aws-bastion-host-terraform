resource "tls_private_key" "private_key" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {

    # Name of key
    key_name   = "aws_keys_pairs"
    # The public will be generated using the reference of tls_private_key.private_key
    public_key = tls_private_key.private_key.public_key_openssh
}

# save key pair locally
resource "local_file" "tf-key" {
content  = tls_private_key.private_key.private_key_pem
filename = "tf-key-pair.pem"
}