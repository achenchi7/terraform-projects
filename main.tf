## This block of code instructs terraform that we are using AWS
provider "aws" {
    region = "us-east-1"
}

## Deploying a simple web server on EC2
resource "aws_launch_template" "example" {
    name = "my-launch-template"
    image_id = "ami-0453ec754f44f9a4a"
    instance_type = "t2.micro"
    

    user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p ${var.server_port} &
                EOF

    lifecycle {
      create_before_destroy = true
    }

}

resource "aws_security_group" "for_example_instance" {
    name = "terraform-example-instance"

    ingress {
        from_port = var.server_port
        to_port = var.server_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }  
}

resource "aws_autoscaling_group" "example" {
    launch_configuration = aws_launch_template.example.name
    vpc_zone_identifier = data.aws_subnets.default.ids

    target_group_arns = [aws_lb_target_group.tg-for-asg.arn]
    health_check_type = "ELB"
    
    min_size = 2
    max_size = 10

    launch_template {
      id = "${aws_launch_template.example.id}"
      version = "$$Latest"
    }
    tag {
      key = "Name"
      value = "terraform-asg-example"
      propagate_at_launch = true
    }
  
}

data "aws_vpc" "default" {
    default = true
}

data "aws_subnets" "default" {
    filter {
      name = "vpc-id"
      values = [data.aws_vpc.default.id]
    }
  
}