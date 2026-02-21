variable "project_name" {}
variable "private_db_subnets" {
  type = list(string)
}
variable "rds_sg_id" {}