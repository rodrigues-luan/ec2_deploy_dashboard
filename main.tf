terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # salvando o state agora dentro do S3
#   backend "s3" {
#       # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
#       bucket         = "meuoutrobucker123"
#       key            = "terraform-test.tfstate"
#       region         = "us-east-1"
#       encrypt        = true  # Ativa a criptografia
#     }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Aqui coloca o serviço
# Create a VPC
# resource "aws_vpc" "example" {
#   cidr_block = "10.0.0.0/16"
# }

# =============================================================
# aws_s3_bucket (isso tem q ficar igual pois é da documentação)
# A part de cima invoca uma função e abaixo são seus parametros
# resource "aws_s3_bucket" "example" {

#   bucket = "my-tf-test-bucket-luan-teste"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }