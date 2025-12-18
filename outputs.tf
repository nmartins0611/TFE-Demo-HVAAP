output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.rhel_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.rhel_server.public_ip
}

output "instance_public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.rhel_server.public_dns
}

output "ssh_key_name" {
  description = "Name of the SSH key pair"
  value       = aws_key_pair.deployer.key_name
}

output "vault_ssh_key_path" {
  description = "Path to SSH private key in Vault"
  value       = vault_generic_secret.ssh_private_key.path
}

output "security_group_id" {
  description = "Security group ID"
  value       = aws_security_group.rhel_server.id
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "ssh_connection_command" {
  description = "Command to SSH to the instance (requires key from Vault)"
  value       = "ssh -i /path/to/private-key ec2-user@${aws_instance.rhel_server.public_ip}"
}

output "aap_job_status" {
  description = "Status of the AAP job execution"
  value       = aap_job_launch.configure_server.status
}
