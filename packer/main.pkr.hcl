source "amazon-ebs" "shopping" {
  ami_name      = local.image-name
  source_ami    = var.ami_id
  instance_type = "t2.micro"
  ssh_username  = "ec2-user"

  tags = {
    Name    = local.image-name
    Project = var.project_name
    env     = var.project_env
  }
}



packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

build {

  sources = [
    "source.amazon-ebs.shopping"
  ]

  provisioner "file" {
    source      = "../website"
    destination = "/tmp/"
  }

  provisioner "shell" {
    script = "./setup.sh"
    execute_command = "sudo bash {{.Path}}"
  }
}




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

