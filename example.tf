# terraform plan [-destroy]
# terraform apply
# terraform show
# terraform destroy

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

# https://www.terraform.io/intro/getting-started/modules.html
# We can organize Terraform configuration using module system.
#   terraform get [-update]
#   terraform plan/apply
# module "consul" {
#   source = "github.com/hashicorp/consul/terraform/aws"
#   key_name = "AWS SSH KEY NAME"
#   key_path = "PATH TO ABOVE PRIVATE KEY"
#   region   = "us-east-1"
#   servers  = "3"
# }

# We can store Terraform state in a remote backend.
#   terraform init
# terraform {
#   backend "consul" {
#     address = "demo.consul.io"
#     path    = "getting-started-ryym64-terraform"
#     lock    = false
#   }
# }
