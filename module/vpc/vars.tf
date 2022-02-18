variable "cidr_range" {}
variable "vpc_feenix_id" {}
variable "sub_pub_block" {
    type = string
    default = "10.0.1.0/24"
  
}

variable "sub_prv_block" {
    type = string
    default = "10.0.2.0/24"
  
}

variable "sg_ports" {
    type = list(number)
    default = [22, 80, 443]
  
}
variable "env_name" {}