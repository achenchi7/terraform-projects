## AMI Lookup
data "aws_ami" "amazon-ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}



## Launch an EC2 instance to install your webserver
resource "aws_instance" "web-server" {
  ami = data.aws_ami.amazon-ami.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public-subnet.id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo yum systemctl start httpd
    sudo yum systemctl enable httpd
    echo "It's Christmas" > /var/www/html/index.html
  EOF

  tags = {
    Name = var.instance_name
  }
}
