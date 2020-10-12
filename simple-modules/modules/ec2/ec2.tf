resource "aws_instance" "web" {
  ami           = "ami-032930428bf1abbff"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
