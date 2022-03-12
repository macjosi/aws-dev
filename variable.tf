variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
    description = "choose cidr_block"
  
}
variable "subnet_cidr" {
    type = string
    default = "10.0.1.0/24"
  
}