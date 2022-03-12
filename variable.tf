variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
    description = "choose cidr_block"
  
}
variable "subnet_cidr"{
    type = string
    default = "10.0.1.0/24"
    description = "choose subnet cidr"
    }

variable "instance_type"{
    type = string
    default = "t2.micro"
    description = "must use cheap instance"
}
variable "ami_id" {
    type = string
    default = "ami-0359b3157f016ae46"
  
}
  