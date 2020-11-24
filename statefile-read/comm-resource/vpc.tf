
provider "aws" {
region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-spovedd"
    key    = "state-read-terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

output "Vpc_id" {
  value = "${aws_vpc.main.id}"
}
