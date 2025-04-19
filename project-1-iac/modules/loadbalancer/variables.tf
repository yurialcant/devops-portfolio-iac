variable "name" {
  type        = string
  description = "Nome base para o Load Balancer e Target Group"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags adicionais para os recursos"
}

variable "security_group_ids" {
  type        = list(string)
  description = "IDs dos Security Groups a serem associados ao Load Balancer"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "IDs das subnets públicas onde o Load Balancer será criado"
}

variable "vpc_id" {
  type        = string
  description = "ID da VPC"
}

variable "target_group_port" {
  type        = number
  default     = 80
  description = "Porta na qual as instâncias no Target Group estão ouvindo"
}

variable "target_group_protocol" {
  type        = string
  default     = "HTTP"
  description = "Protocolo usado pelas instâncias no Target Group (HTTP ou HTTPS)"
}

variable "health_check_path" {
  type        = string
  default     = "/"
  description = "Caminho para a health check na sua aplicação"
}

variable "health_check_protocol" {
  type        = string
  default     = "HTTP"
  description = "Protocolo para a health check (HTTP ou HTTPS)"
}

variable "health_check_port" {
  type        = string
  default     = "traffic-port"
  description = "Porta para a health check (traffic-port para usar a porta do target group)"
}

variable "health_check_matcher" {
  type        = string
  default     = "200"
  description = "Código(s) de resposta HTTP esperados para a health check (e.g., '200', '200-399')"
}

variable "health_check_interval" {
  type        = number
  default     = 30
  description = "Intervalo (em segundos) entre as health checks"
}

variable "health_check_timeout" {
  type        = number
  default     = 5
  description = "Timeout (em segundos) para cada health check"
}

variable "health_check_healthy_threshold" {
  type        = number
  default     = 2
  description = "Número de health checks bem-sucedidas necessárias para considerar a instância saudável"
}

variable "health_check_unhealthy_threshold" {
  type        = number
  default     = 2
  description = "Número de health checks malsucedidas necessárias para considerar a instância não saudável"
}

variable "http_listener_port" {
  type        = number
  default     = 80
  description = "Porta na qual o listener HTTP do Load Balancer escutará"
}

variable "instance_id" {
  type        = string
  description = "ID da instância EC2 a ser anexada ao Target Group"
}

variable "instance_port" {
  type        = number
  default     = 80
  description = "Porta na qual a aplicação Flask está rodando na instância EC2"
}

# Variáveis para HTTPS (opcional)
# variable "https_listener_port" {
#   type        = number
#   default     = 443
#   description = "Porta na qual o listener HTTPS do Load Balancer escutará"
# }
#
# variable "ssl_policy" {
#   type        = string
#   default     = "ELBSecurityPolicy-2016-08"
#   description = "Política de SSL para o listener HTTPS"
# }
#
# variable "certificate_arn" {
#   type        = string
#   description = "ARN do certificado SSL/TLS a ser usado pelo listener HTTPS"
# }