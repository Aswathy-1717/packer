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

build {
  sources = ["source.amazon-ebs.shopping"]

 
  provisioner "file" {
    source      = "../website"
    destination = "/tmp/"
  }

provisioner "shell" {
    script = "./setup.sh"
    execute_command = "sudo {{.Path}}"
  }
}
