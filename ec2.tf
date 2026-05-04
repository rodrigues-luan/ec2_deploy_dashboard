# O data ta socilitando o consumo do AMI ID, do tipo Ubuntu, e pega o mais recente
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Ubuntu
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id # aqui ta consumindo os dados da AWS
  instance_type = "t3.micro" # var.instance_type # ou usa inserindo o valor direto ou baseado na variável ou var.instance_type
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  tags = {
    Name = "HelloStreamlit"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y docker.io git
              sudo systemctl start docker
              sudo systemctl enable docker

              # Clonar o repositório do GitHub
              git clone https://github.com/lvgalvao/terraform-streamlit.git /app

              # Construir e executar o contêiner Docker
              cd /app
              sudo docker build -t streamlit-app .
              sudo docker run -d -p 8501:8501 streamlit-app
              EOF
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}
