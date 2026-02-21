variable "project_name" {}
variable "ec2_sg_id" {}
variable "private_app_subnets" {
  type = list(string)
}