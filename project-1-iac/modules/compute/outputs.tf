output "instance_id" {
  description = "ID da instância criada"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "IP público da instância criada"
  value       = aws_instance.this.public_ip
}
