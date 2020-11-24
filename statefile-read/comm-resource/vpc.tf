
provider "aws" {
region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-spovedd"
    key    = "state-comm-terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_vpc" "main" {
  cidr_block       = "172.16.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}
