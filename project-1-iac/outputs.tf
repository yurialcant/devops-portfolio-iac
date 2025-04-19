# Outputs do módulo de rede
output "vpc_id" {
  description = "ID da VPC criada"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "Lista de IDs das subnets públicas"
  value       = module.network.public_subnet_ids
}

output "security_group_ids" {
  description = "Lista de IDs dos Security Groups criados"
  value       = module.network.security_group_ids
}

# Outputs do módulo de computação
output "instance_id" {
  description = "ID da instância EC2 criada"
  value       = module.compute.instance_id
}

output "public_ip" {
  description = "IP público da instância EC2"
  value       = module.compute.public_ip
}
