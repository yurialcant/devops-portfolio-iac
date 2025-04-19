terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-east-1"
}



module "network" {
  source   = "./modules/network"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  region   = var.region

  public_subnet_cidr_az1 = var.public_subnet_cidr_az1
  public_subnet_cidr_az2 = var.public_subnet_cidr_az2

}


module "compute" {
  source = "./modules/compute"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  name          = var.instance_name

  subnet_id          = module.network.public_subnet_ids[0]
  security_group_ids = module.network.security_group_ids

  tags = {
    Name     = var.instance_name
    Ambiente = "dev"
  }
}

module "loadbalancer" {
  source = "./modules/loadbalancer"

  name               = var.project_name
  security_group_ids = [module.network.alb_security_group_id]
  public_subnet_ids  = module.network.public_subnet_ids
  vpc_id             = module.network.vpc_id

  instance_id   = module.compute.instance_id
  instance_port = 80

  target_group_port     = 80
  target_group_protocol = "HTTP"
  health_check_path     = "/"

  http_listener_port = 80

  # Configuração HTTPS (opcional)
  # https_listener_port = 443
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = "arn:aws:acm:us-east-1:123456789012:certificate/your-certificate-id"
}

output "alb_dns" {
  value       = module.loadbalancer.lb_dns_name
  description = "DNS do Application Load Balancer"
}
