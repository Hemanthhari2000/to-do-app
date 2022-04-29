provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile="966185979698_Admin-Account-Access"
}
resource "aws_s3_bucket" "terraform_state" {
  bucket = "s3-bucket-kubeginners"
  # Enable versioning so we can see the full revision history of our state files
  versioning {
    enabled = true
  }
  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

data "aws_subnet_ids" "subnets" {
  vpc_id = var.vpc_id

}


module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_name    = var.cluster_name
  cluster_version = "1.20"

  //creates kubeconfig file to use kubectl
  write_kubeconfig = true

  subnets = [tolist(data.aws_subnet_ids.subnets.ids)[0], tolist(data.aws_subnet_ids.subnets.ids)[1]]
  vpc_id  = var.vpc_id
  //cluster_security_group_id = aws_security_group.all_worker_mgmt.id

  tags = {
    Name = "kubeginners-cluster"
  }

  //manage_aws_auth = false

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = var.instance_type
      key_name                      = "hemanth-key-pair"
      additional_security_group_ids = [aws_security_group.kubeginners_worker_group_one_sg.id]
      asg_desired_capacity          = 2
    }
  ]
}


data "aws_eks_cluster" "kubeginners_cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "kubeginners_cluster_auth" {
  name = module.eks.cluster_id
}
