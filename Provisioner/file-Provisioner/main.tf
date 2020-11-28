provider "aws" {
region = "us-east-1"
}


resource "aws_instance" "web" {
  ami           = "ami-04bf6dcdc9ab498ca"
  instance_type = "t2.micro"
  key_name      = "aws_iny_lappi"
  tags = {
    Name = "Test-file-provisioner"
  }
}
