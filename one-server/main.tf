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

  tags = {
    Name = "aws09-terraform-example"
  }
}
