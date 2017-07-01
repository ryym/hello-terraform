# I created IAM user named 'hello-terraform'.
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "us-east-1"
}

variable "amis" {
    type = "map"
    default = {
      "us-east-1" = "ami-b374d5a5"
      "us-west-2" = "ami-4b32be2b"
    }
}

# We can use lists.
# variable "cidrs" { type = "list" }
# cidrs = [ "10.0.0.0/16", "10.1.0.0/16" ]

# We can confirm output values by `terraform output`

output "ip" {
    value = "${aws_eip.ip.public_ip}"
}
