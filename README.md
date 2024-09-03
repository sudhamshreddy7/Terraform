# Terraform

**Setting up AWS account for Terraform**
1. Create access key and secret key for an AWS user
2. install aws CLI on you machine
3. run below commands to configure AWS account on your machine and enter the access key and secret key
    '''aws config'''

**Setting up Azure account for Terraform:**
1. Install azure cli on your machine
2. follow instruction on https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret to create azure client id, client_secret.

**Setting up GCP account for Terraform**
1. Create service account on gcp and download the credentials on your local file
2. Provide credentails in your provider.tf

**Creating public and private key for SSH:**
1. Create a public and private key using below command
    """ssh-keygen -t rsa -b 4096"""
2. Enter the file name for more security add paraphrase
3. Never share your private key.

**Deploying a multiple EC2 instance which allows SSH into them:**
1. Modify the ec2.tf file accounding to the requirements

**Deploying a VM instance on Azure which allows SSH into them:**
1. Modify the vm.tf file accounding to the requirements

**Deploying a VM instance on GCP which allows SSH into them:**
1. Modify the cloud_compute.tf file accounding to the requirements



***Note: All secret variables stored in Secret.tf file***


***Deploying the scripts:***
1. run below commands
    '''terraform plan'''
    '''terraform apply'''
2. To delete the resources 
    '''terraform destroy'''
