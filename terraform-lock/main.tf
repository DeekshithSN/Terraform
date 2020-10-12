provider "aws" {
    region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-spovedd"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "spovedd-lock"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
