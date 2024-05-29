provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "namdeployer_keye" {
  key_name   = "llavesnake"
  public_key = file("~/.ssh/llavesnake.pub")
}

resource "aws_security_group" "snake_sg" {
  name        = "snake-security-group"
  description = "Habilita los puertos 22, 3000"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }
}

resource "aws_instance" "snake_instance" {
  ami           = "ami-0e001c9271cf7f3b9"  
  instance_type = "t2.large"
  key_name      = "llavesnake"

  security_groups = [aws_security_group.snake_sg.name]

  tags = {
    Name = "Instancia-Snake"
  }

  user_data =<<-EOF
      #!/bin/bash
      sudo apt update
      sudo apt install ufw -y
      sudo ufw allow 3000/tcp
      sudo ufw enable
      sudo apt install docker-compose -y
      git clone https://github.com/dano796/app.git
      cd app/
      sudo docker build -t appsnake:v01 .
      sudo docker run -d -p 3000:3000 appsnake:v01 npm start
    EOF

  associate_public_ip_address = true
}
