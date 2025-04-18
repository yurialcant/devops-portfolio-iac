output "vpc_id" {
  description = "ID da VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs das subnets públicas"
  value       = aws_subnet.public[*].id
}

output "security_group_ids" {
  description = "IDs dos Security Groups"
  value = [
    aws_security_group.ssh.id,
    aws_security_group.http.id,
    aws_security_group.db.id
  ]
}

