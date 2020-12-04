provider "aws" {
region = "us-east-1"
}


resource "aws_instance" "web" {
  ami           = "ami-04bf6dcdc9ab498ca"
  instance_type = "t2.micro"
  tags = {
    Name = "local-exec-provisioner"
  }
  
  provisioner "local-exec" {
    command = "echo ${self.private_ip}, ${self.public_ip} >> private_and_public_ips.txt"
  }
  
}



# resource "null_resource" "copyhtml" { 
#   provisioner "local-exec" {
#     command = "echo ${aws_instance.web.private_ip}, ${aws_instance.web.public_ip} >> private_and_public_ips.txt"
#     }
#   }
