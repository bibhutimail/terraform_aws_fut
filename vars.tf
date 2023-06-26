variable "ami_id_select" {
    type = map
    default = {
        us-east-1 = "ami-0ed9277fb7eb570c9"
        ap-south-1 = "ami-0ed9277fb7eb570c9"
    }
}

variable "instance_type_select" {
    type = map
    default = {
        us-east-1 = "t2.micro"
        ap-south-1 = "t2.small"
    }
  
}

variable "region_name" {
    type = string
}
variable "env_name" {
type = string
}

#VPC Network varibles
variable "cidr_range" {
    type = string
    default = "10.0.0.0/16"
  
}
