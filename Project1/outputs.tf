output "webserver-public-ip" {
    value = aws_instance.web-server.public_ip
    description = "The public ip address of the instance"
}

output "instance_ami" {
    value = aws_instance.web-server.ami
    description = "The ami id of the instance"
  
}