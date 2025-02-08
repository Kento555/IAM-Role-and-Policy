data "aws_vpc" "selected" {
 id = var.vpc_id
}

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

data "aws_subnets" "private" {      # Defines a data source that retrieves subnets.
 filter {                           # Specifies how to filter subnets.
   name   = "vpc-id"                # Filters subnets that belong to a specific VPC.
   values = [var.vpc_id]            # Uses the VPC ID stored in a Terraform variable.
 }                                  # If you want to reference the private subnets later, you can use:
 filter {                           # subnet_ids = data.aws_subnets.private.ids
   name   = "tag:Name"              # Filters resources based on the Name tag.
   values = ["*private*"]           # Uses a wildcard match (*private*), meaning
 }                                  # Matches any subnet where the Name tag contains "private", such as
}                                   # "my-private-subnet-1", "private-subnet-2"


data "aws_key_pair" "ws_keypair" {
  key_name           = "weishen-keypair"  # *** This is my keypair.
  include_public_key = true               # Fetches the public key along with the key pair details.
}