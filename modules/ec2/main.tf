locals {
  prefix = "psalnikov-learning-terraform"
}

resource "aws_vpc" "vpc" {
  cidr_block = "172.31.0.0/24"

  tags = {
    Name = "${local.prefix}-vpc"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.31.0.0/25"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_security_group" "sg-ssh" {
  name        = "${local.prefix}-sg-ssh"
  description = "Allow SSH"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0", aws_subnet.subnet.cidr_block]
  }
}

resource "aws_instance" "ec2" {
  count         = var.ec2_enabled == true ? 1 : 0
  instance_type = "t2.micro"
  ami           = "ami-0ceecbb0f30a902a6"
  subnet_id     = aws_subnet.subnet.id

  vpc_security_group_ids = [aws_security_group.sg-ssh.id]
  depends_on = [
    aws_subnet.subnet
  ]

  tags = merge(
    var.default_tags,
    {
      Name = "${local.prefix}-ec2"
    }
  )

  lifecycle {
    ignore_changes = [tags]
  }
}
