provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "namdeployer_keye" {
  key_name   = "llavepiano"
  public_key = file("llavepiano.pub")
}

resource "aws_security_group" "piano_sg" {
  name        = "piano-security-group"
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

resource "aws_instance" "piano_instance" {
  ami           = "ami-0e001c9271cf7f3b9"  
  instance_type = "t2.large"
  key_name      = "llavepiano"

  security_groups = [aws_security_group.piano_sg.name]

  tags = {
    Name = "Piano App - DOA"
  }

  user_data =<<-EOF
      #!/bin/bash
      sudo apt update
      sudo apt install ufw -y
      sudo ufw allow 3000/tcp
      sudo ufw enable
      sudo apt install docker-compose -y
      git clone https://github.com/dano796/virtual-piano-iac-deployment.git
      cd ProyectoFinalDOA/
      sudo docker build -t piano:v01 .
      sudo docker run -d -p 3000:3000 piano:v01 npm start
    EOF

  associate_public_ip_address = true
}
