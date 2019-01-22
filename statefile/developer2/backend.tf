terraform {
  backend "s3" {
    region  = "us-west-2"
    bucket  = "com.deekshith.terraform1"
    key     = "state.tfstate"
    encrypt = true                       #AES-256 encryption
  }
}
