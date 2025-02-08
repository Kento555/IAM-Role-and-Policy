# IAM-Role-and-Policy

Validate:
1. SSH into EC2
![alt text](image.png)

2. Validate permission to list table
aws cli code:

aws dynamodb list-tables \
    --region us-east-1

Terminal Outcome:
![alt text](image-1.png)

AWS console Outcome:
![alt text](image-2.png)

3. Valdiate permission to scan table
aws dynamodb scan \
     --table-name ws-tf-bookinventory \
     --region us-east-1
     --exclusive-start-key "LastEvaluatedKeyHere"

Terminal outcome: 
![alt text](image-3.png)

AWS Console Outcome:
![alt text](image-4.png)


