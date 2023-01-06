
variable "subnet_cidrs" {
  type = list(string)
}

variable "our_region" {
  type = string
}

variable "vpc_cidrs" {
  type = list(string)
}

variable "az" {
    type = list(string)
}