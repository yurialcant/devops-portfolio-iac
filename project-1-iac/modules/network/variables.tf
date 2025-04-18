variable "vpc_cidr" {
  description = "CIDR block da VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR da subnet pública"
  type        = string
}

variable "availability_zone" {
  description = "Zona de disponibilidade para a subnet pública"
  type        = string
}

variable "vpc_name" {
  description = "Nome da VPC e dos recursos de rede"
  type        = string
}
