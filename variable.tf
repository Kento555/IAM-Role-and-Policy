variable "name_prefix" {
 description = "Name prefix "
 type        = string
 default     = "ws"
}

variable "instance_type" {
 description = "Instance type of ec2"
 type        = string
 default     = "t2.micro"
}

variable "instance_count" {
 description = "Count of ec2 instance"
 type        = number
 default     = 1
}

variable "vpc_id" {
 description = "Virtual private cloud id"
 type        = string
 default     = "vpc-012814271f30b4442"    # This is VPC ID for "ce9-coaching-shared-vpc"

}

# If var.public_subnet is true → Use public subnets, (data.aws_subnets.public.ids).
# If var.public_subnet is false → Use private subnets, (data.aws_subnets.private.ids).
variable "public_subnet" {
 description = "Choice of deploying to public or private subnet"
 type        = bool
 default     = true
}


