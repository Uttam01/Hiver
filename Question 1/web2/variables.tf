variable "sg_name" {
    type = string
}
variable "description" {
    type = string
}


variable "server_volume_root_size" {
  
}
variable "server_volume_data_size" {
  
}
variable "subnet_id" {
    type = list(string)
}
variable "key_name" {
    type = string
}
variable "instance_type" {
    type = string
}
variable "web2_ami" {
    type = string
}
