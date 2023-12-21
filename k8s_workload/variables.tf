variable "mysql_intranet_ip" {
  default = "10.0.0.190"
}

variable "subnet_id" {
  default = "subnet-1l9qpoby"
}

variable "lb_id" {
  default = "lb-mpfj0dhu"
}

variable "service-lb-name" {
  default = "wordpress-mysql"
}

variable "service-lb-config-name" {
  default = "service-lb-config"
}

variable "ingress-lb-name" {
  default = "ingress-lb"
}

variable "ingress-lb-config-name" {
  default = "ingress-lb-config"
}

variable "ssl-cert-name" {
  default = "ssl-cert"
}

variable "cdn-domain" {
  default = ""
}
