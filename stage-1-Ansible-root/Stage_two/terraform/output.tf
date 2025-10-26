# outputs.tf — Stage 2 (AWS + Ansible Integration)

output "aws_instance_public_ips" {
  description = "Public IP addresses of the EC2 instances created"
  value       = [aws_instance.server1.public_ip, aws_instance.server2.public_ip]
}

output "aws_instance_private_ips" {
  description = "Private IP addresses of the EC2 instances created"
  value       = [aws_instance.server1.private_ip, aws_instance.server2.private_ip]
}

output "aws_security_group_id" {
  description = "ID of the security group used by the EC2 instances"
  value       = aws_security_group.server_sg.id
}

output "aws_region" {
  description = "AWS region used for deployment"
  value       = var.region
}

output "ansible_inventory_file" {
  description = "Path to the generated Ansible inventory file"
  value       = var.ansible_inventory
}

output "ansible_playbook_file" {
  description = "Path to the Ansible playbook file executed"
  value       = var.ansible_playbook
}
