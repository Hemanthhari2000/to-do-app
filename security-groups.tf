
resource "aws_security_group" "kubeginners_worker_group_one_sg" {
  name_prefix = "worker_group_mgmt_one"
  vpc_id      = var.vpc_id
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["10.100.108.189/32"]
  }
}

#resource "aws_security_group" "kubeginners_worker_group_two_sg" {
#  name_prefix = "worker_group_mgmt_two"
#  vpc_id      = var.vpc_id
#
#  //FOR MANAGEMENT
#  ingress {
#    from_port = 22
#    to_port   = 22
#    protocol  = "tcp"
#
#    cidr_blocks =  ["0.0.0.0/0"]
#  }
#}

//ACCESSIBLE FROM OUTSIDE??
resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_management"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}
