variable "region" {
  default = "na-siliconvalley"
}

variable "availability_zone" {
  default = "na-siliconvalley-1"
}

variable "team_tag" {
  default = "myteam"
}

variable "role_tag" {
  default = "test"
}


#####vpc & subnets

variable "vpc_name" {
  default = "mz-test"
}

variable "subnet_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/24"]
}


#####sg and sg rules

variable "sg_rules_type" {
  type    = list(string)
  default = ["ingress"]
}

variable "ip_protocol" {
  type    = list(string)
  default = ["ALL"]
}

variable "port_range" {
  type    = list(string)
  default = [""]
}

variable "sg_rules_policy" {
  type    = list(string)
  default = ["ACCEPT"]
}

variable "cidr_ip" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_rules_description" {
  type    = list(string)
  default = ["tf"]
}


#####eks

variable "k8s_version" {
  default = "1.20.6"
}

#####cdn

variable "cdn_domain" {
  default = ""
}
