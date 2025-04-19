variable "vpc_cidr" {
  type        = string
  description = "CIDR block para a VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_az1" {
  type        = string
  description = "CIDR block para a subnet pública na AZ 1"
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr_az2" {
  type        = string
  description = "CIDR block para a subnet pública na AZ 2"
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  type        = string
  description = "Zona de disponibilidade para a instância EC2 (apenas para a instância)"
  default     = "us-east-1a"
}

variable "region" {
  type        = string
  description = "Região da AWS"
  default     = "us-east-1"
}

variable "vpc_name" {
  type        = string
  description = "Nome para a VPC e outros recursos"
  default     = "flask-vpc"
}

variable "ami_id" {
  description = "AMI ID para a instância EC2"
  type        = string
}

variable "instance_type" {
  type        = string
  description = "Tipo da instância EC2"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "Nome da chave SSH"
}

variable "instance_name" {
  type        = string
  description = "Nome da instância EC2"
  default     = "flask-instance"
}

variable "project_name" {
  type        = string
  description = "projeto-iac"
  default     = "portfolio-iac"
}
