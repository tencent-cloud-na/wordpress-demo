#create a managed mysql service with private access
resource "tencentcloud_mysql_instance" "mysql" {
  internet_service  = 0
  engine_version    = "5.7"
  charge_type       = "POSTPAID"
  root_password     = ""
  slave_deploy_mode = 1
  first_slave_zone  = "${var.region}-2"
  second_slave_zone = "${var.region}-1"
  slave_sync_mode   = 1
  availability_zone = var.availability_zone
  instance_name     = "${var.region}-mysql-wordpress"
  mem_size          = 128000
  volume_size       = 250
  vpc_id            = tencentcloud_vpc.vpc.id
  subnet_id         = tencentcloud_subnet.subnets.0.id
  intranet_port     = 3306
  security_groups   = [tencentcloud_security_group.sg.id]

  tags = (merge(
    local.common_tags,
    local.extra_tags
  ))
}
