provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "techassist_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name    = "techassist-vpc"
    Project = var.project_name
  }
}

resource "aws_subnet" "techassist_subnet" {
  vpc_id                  = aws_vpc.techassist_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-3a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "techassist-subnet-public"
    Project = var.project_name
  }
}

resource "aws_internet_gateway" "techassist_igw" {
  vpc_id = aws_vpc.techassist_vpc.id

  tags = {
    Name    = "techassist-igw"
    Project = var.project_name
  }
}

resource "aws_route_table" "techassist_rt" {
  vpc_id = aws_vpc.techassist_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.techassist_igw.id
  }

  tags = {
    Name    = "techassist-rt"
    Project = var.project_name
  }
}

resource "aws_route_table_association" "techassist_rta" {
  subnet_id      = aws_subnet.techassist_subnet.id
  route_table_id = aws_route_table.techassist_rt.id
}

resource "aws_security_group" "techassist_sg" {
  name        = "techassist-sg"
  description = "Security group pour la plateforme TechAssist"
  vpc_id      = aws_vpc.techassist_vpc.id

  ingress {
    description = "SSH depuis admin DevOps"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP public"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS public securise"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Grafana dashboard"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "techassist-sg"
    Project = var.project_name
  }
}

resource "aws_instance" "techassist_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.techassist_subnet.id
  vpc_security_group_ids = [aws_security_group.techassist_sg.id]
  key_name               = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get upgrade -y
    apt-get install -y docker.io docker-compose
    systemctl start docker
    systemctl enable docker
    apt-get install -y curl git wget
    echo "Serveur TechAssist initialise avec succes" > /tmp/init.log
  EOF

  tags = {
    Name    = "techassist-server"
    Project = var.project_name
    Env     = "production"
  }
}

resource "aws_s3_bucket" "techassist_backups" {
  bucket = "techassist-helpdesk-backups-${var.environment}"

  tags = {
    Name    = "techassist-backups"
    Project = var.project_name
  }
}

resource "aws_s3_bucket_versioning" "techassist_versioning" {
  bucket = aws_s3_bucket.techassist_backups.id
  versioning_configuration {
    status = "Enabled"
  }
}
