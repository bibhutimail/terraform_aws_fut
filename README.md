# terraform
Usage:-

module "feenix_fut" {
    source = "github.com/bibhutimail/terraform_aws_fut"
    ami_id_select = lookup(var.ami_id_select, var.region_name, "us-east-1")
    instance_type_name = lookup(var.instance_type_select, var.region_name, "t2.micro")
    subnet_id_feenix = module.vpc_pre_prod.subnet_feenix
    vpc_security_group = module.vpc_pre_prod.vpc_security_group_id
    env_name = var.env_name
  
}
