resource "aws_vpc" "vpc_feenix" {
    cidr_block = var.cidr_range

    tags = {
      "Name" = "vpc_feenix"
      "project" = "fut"
      "env_name" = var.env_name
    }
  
}

#subneting
resource "aws_subnet" "sub_pub_feenix" {
    vpc_id = var.vpc_feenix_id
    cidr_block = var.sub_pub_block
    tags = {
      "Name" = "sub_pub_feenix"
      "env_name" = var.env_name
    }
  
}

resource "aws_subnet" "sub_prv_feenix" {
    vpc_id = aws_vpc.vpc_feenix.id
    cidr_block = var.sub_prv_block
    tags = {
      "Name" = "sub_prv_feenix"
    }
  
}

#Security Group
resource "aws_security_group" "ssh_web_sg" {
  vpc_id = aws_vpc.vpc_feenix.id
    name = "ssh_web_sg"
    dynamic "ingress" {
        for_each = var.sg_ports
        content {
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tcp"
            cidr_blocks = [ "0.0.0.0/0" ]

        }
    }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    tags = {
      "Name" = "ssh_web_sg"
    }
  
}

#Internet Gatway
resource "aws_internet_gateway" "feenix_ig" {
    vpc_id = aws_vpc.vpc_feenix.id
    tags = {
      "Name" = "feenix_ig"
      "Project" = "fut"
    }
    

}

#Route tabel
resource "aws_route_table" "feenix_public_rt" {
    vpc_id = aws_vpc.vpc_feenix.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.feenix_ig.id
    }
    tags = {
      "Name" = "feenix_public_rt"
    }
    
}

#Subnet attach with Route Table
resource "aws_route_table_association" "feenix_sub_attach" {
    subnet_id = aws_subnet.sub_pub_feenix.id
    route_table_id = aws_route_table.feenix_public_rt.id
  
}