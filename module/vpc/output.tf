output "vpc_feenix_id" {
    value = aws_vpc.vpc_feenix.id
  
}
output "subnet_feenix" {
    value = aws_subnet.sub_pub_feenix.id
  
}

output "vpc_security_group_id" {
    value = aws_security_group.ssh_web_sg.id
  
}
