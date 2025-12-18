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

output "workflow_job_template_id" {
  description = "AAP Workflow Job Template ID"
  value       = data.aap_workflow_job_template.configure_server.id
}

output "workflow_job_template_name" {
  description = "AAP Workflow Job Template Name"
  value       = data.aap_workflow_job_template.configure_server.name
}

output "workflow_job_status" {
  description = "Status of the AAP workflow job execution"
  value       = aap_workflow_job_template.configure_server.status
}

output "workflow_job_id" {
  description = "AAP Workflow Job ID"
  value       = aap_workflow_job_template.configure_server.id
}

output "key_suffix" {
  description = "Random suffix used for SSH key naming"
  value       = random_id.suffix.hex
}
