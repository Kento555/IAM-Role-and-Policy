# Defines a local variable (selected_subnet_ids) that dynamically selects either public or private subnets.
locals {
 selected_subnet_ids = var.public_subnet ? data.aws_subnets.public.ids : data.aws_subnets.private.ids
}

resource "aws_instance" "ec2-iam" {
 ami                    = data.aws_ami.latest_amazon_linux.id 
 instance_type          = var.instance_type
 subnet_id              = local.selected_subnet_ids[count.index % length(local.selected_subnet_ids)]
 vpc_security_group_ids = [aws_security_group.ec2-iam.id]
 iam_instance_profile   = aws_iam_instance_profile.profile_0802.name
 key_name               = data.aws_key_pair.ws_keypair.key_name
 count                  = var.instance_count
 associate_public_ip_address = true
 tags = {
   Name = "${var.name_prefix}-ec2-iam-${count.index}"
 }
}

resource "aws_security_group" "ec2-iam" {
 name_prefix = "${var.name_prefix}-ec2-iam"
 description = "Allow traffic to ec2-iam"
 vpc_id      = data.aws_vpc.selected.id

# Allow HTTP (Port 80)
 ingress {
   from_port        = 80
   to_port          = 80
   protocol         = "tcp"
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
 }

 # Allow SSH (Port 22)
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]  # Not secure! Restrict to your IP.
    ipv6_cidr_blocks = ["::/0"]
  }

 egress {
   from_port        = 0
   to_port          = 0
   protocol         = "-1"
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
 }

 lifecycle {
   create_before_destroy = true
 }
}




 