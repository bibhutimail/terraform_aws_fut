resource "aws_instance" "feenix_web1" {
  ami = var.ami_id_select
  instance_type = var.instance_type_name
  subnet_id = var.subnet_id_feenix
  vpc_security_group_ids = [var.vpc_security_group]
  associate_public_ip_address = true
  key_name = "feenix_fut"

  tags = {
    "Name" = "Feenix_web1"
    "project" = var.env_name
  }

  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file("./feenix_fut.pem")
    timeout = "4m"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install nginx1 -y",
      "sudo systemctl start nginx"
    ]
    
  }
}
