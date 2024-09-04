import subprocess
import json

def run_command(command):
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        raise RuntimeError(f"Command failed with error: {result.stderr}")
    return result.stdout.strip()

# Get the public IP output from Terraform
public_ip_output = run_command("terraform output -json AWS_public_ip_address")
public_ips = json.loads(public_ip_output)  # Assumes output is a list of IPs
public_ip_output =  run_command("terraform output -json AWS_linux_public_ip_address")
linus_ips = json.loads(public_ip_output)
# Define the inventory file path
inventory_file = 'inventory.ini'

# Write the inventory file
with open(inventory_file, 'w') as f:
    f.write('[ec2_instances]\n')
    c = 0
    for ip in public_ips:
        c+=1
        f.write(f'ec2_instance{c} ansible_host={ip} ansible_user=ec2-user ansible_ssh_private_key_file="/Users/sudhamshreddy/Desktop/Terraform/SSH-Key"\n')
    f.write('[ubuntu_instances]\n')
    c=0
    for ip in linus_ips:
        c+=1
        f.write(f'ubuntu_instance{c} ansible_host={ip} ansible_user=ubuntu ansible_ssh_private_key_file="/Users/sudhamshreddy/Desktop/Terraform/SSH-Key"\n')

print(f'Inventory file {inventory_file} updated successfully.')
