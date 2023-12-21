#save k8s config file to local
resource "local_sensitive_file" "config" {
    content  = data.tencentcloud_eks_cluster_credential.eks_cred.kube_config
    filename = "./k8s_workload/tke-access"
}


#mysql private ip
output "mysql_private_ip" {
  value = tencentcloud_mysql_instance.mysql.intranet_ip
}

#cdn cname
output "cdn_cname" {
  value = data.tencentcloud_cdn_domains.cdn.domain_list.0.cname
}

output "EIP" {
  value = tencentcloud_eip.eip.public_ip
}

output "lb_id" {
  value = tencentcloud_clb_instance.clb.id
}
