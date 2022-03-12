resource "aws_vpc" "Foodvpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "Mainvpc"
  }
}
resource "aws_subnet" "FoodsubnetPb" {
  vpc_id     = aws_vpc.Foodvpc.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "MainPub"
  }
}
resource "aws_subnet" "FoodsubnetPr" {
  vpc_id     = aws_vpc.Foodvpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "MainPriv"
  }
}
resource "aws_internet_gateway" "FoodIGW" {
  vpc_id = aws_vpc.Foodvpc.id

  tags = {
    Name = "mainIGW"
  }
}
resource "aws_route_table" "Foodrt" {
  vpc_id = aws_vpc.Foodvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.FoodIGW.id
  }
}
resource "aws_route_table_association" "subnetasso" {
  subnet_id      = aws_subnet.FoodsubnetPb.id
  route_table_id = aws_route_table.Foodrt.id
}
resource "aws_route_table_association" "igasso" {
  gateway_id     = aws_internet_gateway.FoodIGW.id
  route_table_id = aws_route_table.Foodrt.id
}
resource "aws_instance" "mainFood" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Food Instance"
  }
}