provider "aws" {
region = "us-east-1"
}


resource "aws_instance" "web" {
  ami           = "ami-04bf6dcdc9ab498ca"
  instance_type = "t2.micro"
  tags = {
    Name = "Test-file-provisioner"
  }
  
  provisioner "local-exec" {
    command = "echo ${self.web.private_ip}, ${self.web.public_ip} >> private_and_public_ips.txt"
  }
  
}
