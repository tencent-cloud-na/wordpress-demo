#create LB with EIP
resource "tencentcloud_eip" "eip" {
  name = "${var.region}-eip"

  tags = (merge(
    local.common_tags,
    local.extra_tags
  ))
}

resource "tencentcloud_clb_instance" "clb" {
  network_type              = "INTERNAL"
  clb_name                  = "${var.region}-clb"
  project_id                = 0
  vpc_id                    = tencentcloud_vpc.vpc.id
  subnet_id    = tencentcloud_subnet.subnets.0.id

  tags = (merge(
    local.common_tags,
    local.extra_tags
  ))
}

resource "tencentcloud_eip_association" "clb_eip" {
  eip_id      = tencentcloud_eip.eip.id
  instance_id = tencentcloud_clb_instance.clb.id
}
