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

output "workflow_job_id" {
  description = "AAP Workflow Job ID (the execution instance)"
  value       = try(aap_workflow_job.configure_server.id, "Not available - check AAP UI")
}

output "workflow_job_status" {
  description = "Status of the AAP workflow job execution"
  value       = try(aap_workflow_job.configure_server.status, "Check AAP UI for job status")
}

output "workflow_job_url" {
  description = "Direct link to view the workflow job in AAP"
  value       = "${var.aap_host}/#/jobs/workflow/${try(aap_workflow_job.configure_server.id, "ID")}"
}

output "workflow_job_template_id" {
  description = "AAP Workflow Job Template ID that was executed"
  value       = var.aap_workflow_job_template_id
}

output "key_suffix" {
  description = "Random suffix used for SSH key naming"
  value       = random_id.suffix.hex
}

output "retrieve_ssh_key_command" {
  description = "Command to retrieve SSH private key from Vault"
  value       = "vault kv get -field=private_key ${vault_generic_secret.ssh_private_key.path} > rhel-server-key.pem && chmod 600 rhel-server-key.pem"
}
