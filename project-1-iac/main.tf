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

# Módulo de Rede (Network)

module "network" {
  source              = "./modules/network"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  availability_zone   = var.availability_zone
  vpc_name            = var.vpc_name
}

# Módulo de Computação (Compute)
module "compute" {
  source = "./modules/compute"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  name          = var.instance_name

  subnet_id          = module.network.public_subnet_ids[0]
  security_group_ids = module.network.security_group_ids

  tags = {
    Name      = var.instance_name
    Ambiente  = "dev"
  }
}

