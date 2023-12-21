provider "tencentcloud" {
  region     = var.region
}

locals {
  common_tags = {
    Region      = "${var.region}"
    Team        = "${var.team_tag}"
  }
  extra_tags = {
    Role = "${var.role_tag}"
  }
}

#create vpc
resource "tencentcloud_vpc" "vpc" {
  name         = var.vpc_name
  cidr_block   = "10.0.0.0/16"

  tags = (merge(
    local.common_tags,
    local.extra_tags
  ))
}

#create subnet
resource "tencentcloud_subnet" "subnets" {
  count = length(var.subnet_cidrs)

  availability_zone = var.availability_zone
  name              = "${var.region}-${var.vpc_name}-subnet-${count.index}"
  vpc_id            = tencentcloud_vpc.vpc.id
  cidr_block        = var.subnet_cidrs[count.index]

  tags = (merge(
    local.common_tags,
    local.extra_tags
  ))
}

#create sg
resource "tencentcloud_security_group" "sg" {
  name        = "${var.region}-mysql-test"

  tags = (merge(
    local.common_tags,
    local.extra_tags
  ))
}

resource "tencentcloud_security_group_rule" "sg_rules" {
  count = length(var.ip_protocol)

  security_group_id = tencentcloud_security_group.sg.id
  type              = var.sg_rules_type[count.index]
  #ip_protocol       = var.ip_protocol[count.index]
  #port_range        = var.port_range[count.index]
  policy            = var.sg_rules_policy[count.index]
  cidr_ip           = var.cidr_ip[count.index]
  description       = var.sg_rules_description[count.index]
}
