variable "project_name" {}
variable "launch_template_id" {}
variable "private_app_subnets" {
  type = list(string)
}
variable "target_group_arn" {}