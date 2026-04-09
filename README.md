## Instalando o terraform

### Repositorio terraform Luciano
```
https://github.com/lvgalvao/workshop-terraform
```

### Link do windows (64 bits)
```
https://developer.hashicorp.com/terraform/install
```
---
### 1. Só colocar na pasta bin (se ela não existir é só criar)
```
C:\Users\luanr\bin
```
---
### 2. Vai git no Gitbash pra ver se ja ta ativo
```
terraform -h
```
---
### 3. Primeira bloco a ser usado que é o configuração (Exemplo da aws)
```
https://registry.terraform.io/providers/hashicorp/aws/latest/docs
```
```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
```
---
### 4. Testanto serviço (Criando um bucket)
```
[terraform -h](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
```
```
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
```

### 5. Inciando Terraform
```
terraform init
```

### 6. Plano de execução
```
terraform plan
```

### 7. Lembrar de sempre executar a variável de ambiente
```
export AWS_PROFILE=luanr
```

### 8. com as instruções do que quer fazer ja concluídas
```
terraform apply
```

### 9. comando para formatar arquivo
```
terraform fmt main.tf
```

### 10. serve para remover toda a infraestrutura que o Terraform criou. Lê o arquivo de estado (terraform.tfstate)
```
terraform destroy
```


### 11. salvando o state agora dentro do S3 (para trabalhos colaborativos)
```  
  backend "s3" {
      # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
      bucket         = "meuoutrobucker123"
      key            = "terraform-test.tfstate"
      region         = "us-east-1"
      encrypt        = true  # Ativa a criptografia
    }
```

### 12. Se mexeu no teraform tem que fazer o migrate
```
terraform init -migrate-state
```