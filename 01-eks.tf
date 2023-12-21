#create a EKS cluster
resource "tencentcloud_eks_cluster" "eks" {
  vpc_id                  = tencentcloud_vpc.vpc.id
  k8s_version         = var.k8s_version
  cluster_name  = "${var.region}-eks-wordpress-0"
  subnet_ids = [tencentcloud_subnet.subnets.0.id]
  cluster_desc = "EKS wordpress to mysql database"
  internal_lb {
    enabled = true
    subnet_id = tencentcloud_subnet.subnets.0.id
  }
}
