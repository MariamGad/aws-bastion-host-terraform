variable VPC_CIDR {
    type = string
}

variable NAME {
    type = string
}

variable REGION {
    type = string

}

variable PUBLIC_SUBNETS {
    type= map
    default = {
        pub1 = {
            az = ""
            cidr = ""
        }
        pub2 = {
            az = ""
            cidr = ""
        }
    }
}

variable PRIVATE_SUBNETS {
    type= map
    default = {
        priv1 = {
            az = ""
            cidr = ""
        }
        priv2 = {
            az = ""
            cidr = ""
        }
    }
}
