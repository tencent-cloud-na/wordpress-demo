terraform {
  required_version = "> 0.14.06"
  required_providers {
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = ">=1.56.15"
    }
  }
}
