variable "region" {
  default = "us-east-1"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ssh_key_name" {
  default = "ansible-ssh-key"
}

variable "public_key_path" {
  default = "./.ssh/terraform_rsa.pub"
}

variable "private_key_path" {
  default = "./.ssh/terraform_rsa"
}

variable "ubuntu_ami" {
  default = "ami-0a0e5d9c7acc336f1"  
}

variable "redhat_ami" {
  default = "ami-0583d8c7a9c35822c"  
}