resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name = "Project1-vpc"
    }
  
}

resource "aws_subnet" "public-subnet" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
      Name = "Project1-subnet"
    }
}

resource "aws_internet_gateway" "webserver-igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "Project1-IGW"
  }
}

resource "aws_route_table" "webserver-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.webserver-igw.id
  }

  tags = {
    Name = "public Route table"
  }
}

resource "aws_route_table_association" "public-subnet-asso" {
    subnet_id = aws_subnet.public-subnet.id
    route_table_id = aws_route_table.webserver-rt.id

  
}