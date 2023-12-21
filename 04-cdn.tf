#create CDN
resource "tencentcloud_cdn_domain" "cdn" {
  domain         = var.cdn_domain
  service_type   = "web"
  area           = "overseas"
  full_url_cache = true

  #origin server/domain settings
  origin {
    origin_type          = "ip"
    origin_list          = [tencentcloud_eip.eip.public_ip]
    origin_pull_protocol = "follow"
    #backup_origin_type  = "ip"
    #backup_origin_list  = [""]
  }

  #attach SSL cert to the domain
  https_config {
    https_switch   =  "on"

    server_certificate_config {
      certificate_id = ""
    }
  }

  #set cache rules
  rule_cache {
    follow_origin_switch = "on"
    #cache 30days (unit seconds)
    cache_time   = 259200
    rule_type = "all"
    rule_paths = ["*"]
  }

  rule_cache {
    no_cache_switch = "on"
    cache_time   = 259200
    rule_type = "file"
    rule_paths = ["jsp"]
  }
}
