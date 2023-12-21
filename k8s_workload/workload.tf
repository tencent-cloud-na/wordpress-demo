provider "kubernetes" {
  config_path = "./tke-access"
}


resource "kubernetes_manifest" "wordpress" {
  manifest = yamldecode(templatefile("./deployment/wordpress.yaml", {mysql_private_ip = var.mysql_intranet_ip}))
}

resource "kubernetes_manifest" "secret" {
  manifest = yamldecode(templatefile("./secret/ssl_cert.yaml", {ssl-cert-name = var.ssl-cert-name}))
}

resource "kubernetes_manifest" "service_lb" {
  manifest = yamldecode(templatefile("./service/service_lb.yaml",{lb-id: var.lb_id,lb-subnet: var.subnet_id, service-lb-config-name: var.service-lb-config-name, service-lb-name: var.service-lb-name}))
}

resource "kubernetes_manifest" "service_lb_config" {
  manifest = yamldecode(templatefile("./service/service_lb_config.yaml",{service-lb-config-name: var.service-lb-config-name}))
}

resource "kubernetes_manifest" "ingress_lb" {
  manifest = yamldecode(templatefile("./ingress/ingress_lb.yaml",{cdn-domain= var.cdn-domain, service-lb-name= var.service-lb-name, ingress-lb-config-name= var.ingress-lb-config-name, ingress-lb-name= var.ingress-lb-name, ssl-cert-name= var.ssl-cert-name}))
}

resource "kubernetes_manifest" "ingress_lb_config" {
  manifest = yamldecode(templatefile("./ingress/ingress_lb_config.yaml",{cdn-domain: var.cdn-domain, ingress-lb-config-name: var.ingress-lb-config-name}))
}