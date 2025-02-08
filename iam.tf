# Defines a local variable named name_prefix with the value "ws"
locals {
 name_prefix = "ws"
}

# Create an user role
resource "aws_iam_role" "role_0802" {
 name = "${local.name_prefix}-role-0802"

 assume_role_policy = jsonencode({
   Version = "2012-10-17"
   Statement = [
     {
       Action = "sts:AssumeRole"
       Effect = "Allow"
       Sid    = ""
       Principal = {
         Service = "ec2.amazonaws.com"
       }
     },
   ]
 })
}

data "aws_iam_policy_document" "policy_0802" {
 statement {
   effect    = "Allow"
   actions   = ["ec2:Describe*"]
   resources = ["*"]
 }
 statement {
   effect    = "Allow"
   actions   = ["s3:ListBuckets"]   
   resources = ["*"]
 }
 statement {
   effect    = "Allow"
   actions   = ["s3:ListAllMyBuckets"]   
   resources = ["*"]
 }
 statement {
   effect    = "Allow"
   actions   = ["dynamodb:ListTables","dynamodb:Scan"]   
   resources = ["*"]
}
}
# s3:ListBucket allows listing the contents of a specific bucket.
# s3:ListAllMyBuckets is needed to list all buckets in your AWS account.

resource "aws_iam_policy" "policy_0802" {
 name = "${local.name_prefix}-policy-0802"


 ## Option 1: Attach data block policy document
 policy = data.aws_iam_policy_document.policy_0802.json
}


resource "aws_iam_role_policy_attachment" "attach_0802" {
 role       = aws_iam_role.role_0802.name
 policy_arn = aws_iam_policy.policy_0802.arn
}


resource "aws_iam_instance_profile" "profile_0802" {
 name = "${local.name_prefix}-profile-0802"
 role = aws_iam_role.role_0802.name
}
