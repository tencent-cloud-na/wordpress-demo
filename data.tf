data "tencentcloud_eks_cluster_credential" "eks_cred" {
  cluster_id = tencentcloud_eks_cluster.eks.id
}

data "tencentcloud_cdn_domains" "cdn" {
  domain               =  var.cdn_domain
}
