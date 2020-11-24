provider "aws" {
region = "us-east-1"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "terraform-backend-spovedd"
    key    = "state-comm-terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-example"
  }
}



resource "aws_instance" "web" {
  ami           = "ami-04bf6dcdc9ab498ca"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.my_subnet.id

  tags = {
    Name = "HelloWorld"
  }
}
