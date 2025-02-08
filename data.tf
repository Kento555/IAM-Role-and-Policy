data "aws_vpc" "selected" {
 id = var.vpc_id
}

#  vpc_id        = "vpc-012814271f30b4442" # ce9-coaching-shared-vpc
#  public_subnet = true                    # Set to false for private subnet deployment


data "aws_subnets" "public" {
 filter {
   name   = "vpc-id"
   values = [var.vpc_id]
 }
 filter {
   name   = "tag:Name"
   values = ["*public*"]
 }
}

data "aws_subnets" "private" {
 filter {
   name   = "vpc-id"
   values = [var.vpc_id]
 }
 filter {
   name   = "tag:Name"
   values = ["*private*"]
 }
}