#!/bin/bash

# Apply Terraform configuration
terraform apply -auto-approve 
chmod +x aws_credentails.sh #to store aws credentials in env variables and we gone delete them at the end
source aws_credentails.sh
python3 update_inventory.py  #to update inventory.ini file for ansible

# Use the public IP in Ansible inventory
# ansible-playbook -i inventory.ini install_aws_cli.yml
ansible-playbook -i inventory.ini link_s3_ec2.yml --extra-vars "bucket_name=${aws_bucket} aws_access_key=${aws_access_key} aws_secret_key=${aws_secret_key}" --ssh-extra-args="-o StrictHostKeyChecking=no"
ansible-playbook -i inventory.ini link_s3_ubuntu.yml --extra-vars "bucket_name=${aws_bucket} aws_access_key=${aws_access_key} aws_secret_key=${aws_secret_key}" --ssh-extra-args="-o StrictHostKeyChecking=no"

#delete aws credentials from env variables
unset aws_access_key
unset aws_secret_key
unset aws_bucket
