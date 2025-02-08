 ## Option 2: Inline using jsonencode
resource "aws_iam_policy" "policy_example_jcode" {
 name = "${local.name_prefix}-policy-example-jcode"

 policy = jsonencode({
   Version = "2012-10-17"
   Statement = [
     {
       Action   = ["ec2:Describe*"]
       Effect   = "Allow"
       Resource = "*"
     },
     {
       Action   = ["s3:ListBucket"]
       Effect   = "Allow"
       Resource = "*"
     },
   ]
 })
}

