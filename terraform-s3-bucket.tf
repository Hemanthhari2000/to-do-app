terraform {
  backend "s3" {
    bucket         = "s3-bucket-kubeginners"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    profile="966185979698_Admin-Account-Access"
  }
}