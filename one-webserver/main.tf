terraform {
  #테라폼 버전 지정
  required_version = ">= 1.0.0, < 2.0.0"

  #공급자 버전 지정
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0ab04b3ccbadfae1f"
  instance_type = "t2.micro"
  key_name = "aws09-key"
  vpc_security_group_ids = [aws_security_group.instance.id]
  user_data = <<-EOF
				 #!/bin/bash
				 echo "Hello World" > index.html
				 nohup busybox httpd -f -p 8080 &
				 EOF

  tags = {
    Name = "aws09-terraform-example"
  }
}

# Security Group Setting 8080 Port Open 
resource "aws_security_group" "instance" {
  name = "aws09-terraform-example-8080port-instance"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# Public IP Output
output "public-ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the Instance"
}

