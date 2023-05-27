VPC_CIDR = "10.0.0.0/16"
NAME = "Maryam"
REGION = "us-east-1"
PUBLIC_SUBNETS ={

    pub1 = {
        az = "us-east-1a"
        cidr = "10.0.1.0/24"
    }
    pub2 = {
        az = "us-east-1b"
        cidr = "10.0.2.0/24"
    }
}
PRIVATE_SUBNETS  ={

    priv1 = {
        az = "us-east-1a"
        cidr = "10.0.3.0/24"
    }
    priv2 = {
        az = "us-east-1b"
        cidr = "10.0.4.0/24"
    }
}
