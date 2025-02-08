variable "name_prefix" {
 description = "Name prefix for application"
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
 default     = 3
}


variable "vpc_id" {
 description = "Virtual private cloud id"
 type        = string
 default     = "vpc-012814271f30b4442"
}


variable "public_subnet" {
 description = "Choice of deploying to public or private subnet"
 type        = bool
 default     = true
}


