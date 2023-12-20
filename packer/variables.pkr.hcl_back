variable "project_name" {
  type        = string
  description = "name of the project"
  default     = "shopping"
}

variable "project_env" {
  type        = string
  description = "project environment"
  default     = "production"
}


locals {
  image-timestamp = formatdate("DD-MM-YYYY-mm", timestamp())
  image-name      = "${var.project_name}-${var.project_env}-${local.image-timestamp}"
}


variable "ami_id" {
  type        = string
  default     = "ami-0a0f1259dd1c90938"
}
