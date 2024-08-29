# Terraform
Deploying a multiple EC2 instance which allows SSH into them:
1. Create a public and private key using below command

   **ssh-keygen -t rsa -b 4096**
3. Enter the file name for more security add paraphrase
4. Configure your AWS credentials into your local machine using below command:

   **aws configure**
3. once you are done with configuration modify the ec2.tf file accounding to the requirements
4. run below commands

   **terraform plan**

   **terraform apply**
6. To delete the resources 

   **terraform destroy**
