variable "region" {
  default = "us-east-1"
}

variable "instance_name" {
    description = "This is the name of your instance"
    default = "Website-instance"
  
}

variable "instance_type" {
    default = "t2.micro"
}

variable "key_name" {
  default = "Project1"
}