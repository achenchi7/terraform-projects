## This block of code instructs terraform that we are using AWS
provider "aws" {
    region = "us-east-1"
}

## Deploying a simple server (EC2)
resource "aws_instance" "example" {
    ami = "ami-0453ec754f44f9a4a"
    instance_type = "t2.micro"

    tags = {
      Name = "Terraform-example"
    }
}