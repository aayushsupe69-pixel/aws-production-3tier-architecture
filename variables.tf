variable "project_name" {
  description = "Project name prefix for all resources"
  type        = string
  default     = "aws-production-3tier-ha"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}