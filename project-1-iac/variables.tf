variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "vpc_name" {
  default = "flask-vpc"
}

variable "ami_id" {
  description = "AMI ID para a instância EC2"
  type        = string
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Tipo da instância EC2"
}

variable "key_name" {
  description = "Nome da chave SSH"
  type        = string
}

variable "instance_name" {
  default     = "flask-instance"
  description = "Nome da instância EC2"
}

