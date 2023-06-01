# aws-bastion-host-terraform
 ## Overview
Using Terraform Create EC2 jump server in public subnet to be able to access private EC2 instances 
<div align="center">
<img src=https://github.com/MariamGad/aws-bastion-host-terraform/assets/47721226/53cbd383-1b22-4b1c-838f-0edf0b234c26>
</div>

---

## Prerequisite
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed and configured
* [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
---

## Requirments
* Create VPC with `cidr_block  = 10.0.0.0/16`. 
* Create 2 public subnets.
* Create 2 private subnets.
* Create Internet Gateway and attahced with the VPC.
* Create public and private route tables.
* Associate each route table with the appropriate subnet.
* Create Security group that allow SSH from `0.0.0.0/0`.
* Create EC2 *Bastion host* in public subnets with this security group
* Create Security group that allow SSH from `10.0.0.0/16`.
* Create EC2 *Private host* in private subnets with this security group
---

## Verification
* Install all required files of the cloud provider and used modules `terraform init`
* Check and validate all configurations `terraform plan`
* Create all resources `terraform apply`
* SSH to Bastion host using its public IP
* SSH from Bastion host to private host `ssh -i tf-key-pair.pem ec2-user@Private_IP`
<div align="center">
<img src=https://github.com/MariamGad/aws-bastion-host-terraform/assets/47721226/d55c965f-9f69-4a6c-9c7b-a3aa2122c257>
</div>
