variable "ami_id" {
  description = "ID da AMI para a instância EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "ID da sub-rede onde a instância será lançada"
  type        = string
}

variable "security_group_ids" {
  description = "Lista de IDs de security groups"
  type        = list(string)
}

variable "key_name" {
  description = "Nome da chave SSH"
  type        = string
  default     = null
}

variable "name" {
  description = "Nome para a instância"
  type        = string
}

variable "tags" {
  description = "Tags adicionais para a instância"
  type        = map(string)
  default     = {}
}


