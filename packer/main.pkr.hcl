build {
  name    = "aws"
  sources = ["source.amazon-ebs.ubuntu-app"]

  provisioner "file" {
    source      = "${path.root}/scripts/userdata/userdata-app.sh"
    destination = "/home/ubuntu/userdata-app.sh"
  }

  provisioner "shell" {
    inline = [
      "pwd",
      "ls",
      "sudo mkdir /home/ubuntu/.aws",
      "sudo chmod 777 /home/ubuntu/.aws",
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }

  provisioner "file" {
    #Path to your own AWS Credential File
    source      = "/home/kjaehyeok21/.aws/credentials"
    destination = "/home/ubuntu/.aws/credentials"
  }

  provisioner "file" {
    #Path to your own AWS config file
    source      = "/home/kjaehyeok21/.aws/config"
    destination = "/home/ubuntu/.aws/config"
  }

  provisioner "shell" {
    inline = [
      "cloud-init status --wait",
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }

  provisioner "shell" {
    inline = [
      "echo MYSQL_ROOT_PASSWORD=${var.MYSQL_ROOT_PASSWORD} >> /etc/environment",
      "echo MYSQL_USER=${var.MYSQL_USER} >> /etc/environment",
      "echo MYSQL_PASSWORD=${var.MYSQL_PASSWORD} >> /etc/environment",
      "echo MYSQL_DATABASE=${var.MYSQL_DATABASE} >> /etc/environment"
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }

  provisioner "shell" {
    scripts = [
      "${path.root}/scripts/build/upgrade-apt.sh",
      "${path.root}/scripts/build/install-common-tools.sh",
      "${path.root}/scripts/build/install-docker.sh",
      "${path.root}/scripts/build/install-cwagent.sh",
      "${path.root}/scripts/build/install-cdagent.sh",
      "${path.root}/scripts/build/force-user-data-app.sh"
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }
}


build {
  name    = "aws"
  sources = ["source.amazon-ebs.ubuntu-infra"]

  provisioner "file" {
    source      = "${path.root}/scripts/userdata/userdata-infra.sh"
    destination = "/home/ubuntu/userdata-infra.sh"
  }

  provisioner "shell" {
    inline = [
      "pwd",
      "sudo mkdir /home/ubuntu/.aws",
      "sudo chmod 777 /home/ubuntu/.aws",
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }

  provisioner "file" {
    #Path to your own AWS Credential File
    source      = "/home/kjaehyeok21/.aws/credentials"
    destination = "/home/ubuntu/.aws/credentials"
  }

  provisioner "file" {
    #Path to your own AWS config file
    source      = "/home/kjaehyeok21/.aws/config"
    destination = "/home/ubuntu/.aws/config"
  }

  provisioner "shell" {
    inline = [
      "cloud-init status --wait",
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }

  provisioner "shell" {
    inline = [
      "echo MYSQL_ROOT_PASSWORD=${var.MYSQL_ROOT_PASSWORD} >> /etc/environment",
      "echo MYSQL_USER=${var.MYSQL_USER} >> /etc/environment",
      "echo MYSQL_PASSWORD=${var.MYSQL_PASSWORD} >> /etc/environment",
      "echo MYSQL_DATABASE=${var.MYSQL_DATABASE} >> /etc/environment"
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }

  provisioner "shell" {
    scripts = [
      "${path.root}/scripts/build/upgrade-apt.sh",
      "${path.root}/scripts/build/install-common-tools.sh",
      "${path.root}/scripts/build/install-docker.sh",
      "${path.root}/scripts/build/install-cwagent.sh",
      "${path.root}/scripts/build/install-cdagent.sh",
      "${path.root}/scripts/build/force-user-data-infra.sh"
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }
}

build {
  name    = "aws-single"
  sources = ["source.amazon-ebs.ubuntu-single"]

  provisioner "file" {
    source      = "${path.root}/scripts/userdata/userdata-single.sh"
    destination = "/home/ubuntu/userdata-single.sh"
  }

  provisioner "shell" {
    inline = [
      "pwd",
      "ls",
      "sudo mkdir /home/ubuntu/.aws",
      "sudo chmod 777 /home/ubuntu/.aws",
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }

  provisioner "file" {
    #Path to your own AWS Credential File
    source      = "/home/kjaehyeok21/.aws/credentials"
    destination = "/home/ubuntu/.aws/credentials"
  }

  provisioner "file" {
    #Path to your own AWS config file
    source      = "/home/kjaehyeok21/.aws/config"
    destination = "/home/ubuntu/.aws/config"
  }

  provisioner "shell" {
    inline = [
      "cloud-init status --wait",
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }

  provisioner "shell" {
    inline = [
      "echo MYSQL_ROOT_PASSWORD=${var.MYSQL_ROOT_PASSWORD} >> /etc/environment",
      "echo MYSQL_USER=${var.MYSQL_USER} >> /etc/environment",
      "echo MYSQL_PASSWORD=${var.MYSQL_PASSWORD} >> /etc/environment",
      "echo MYSQL_DATABASE=${var.MYSQL_DATABASE} >> /etc/environment"
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }

  provisioner "shell" {
    scripts = [
      "${path.root}/scripts/build/upgrade-apt.sh",
      "${path.root}/scripts/build/install-common-tools.sh",
      "${path.root}/scripts/build/install-docker.sh",
      "${path.root}/scripts/build/install-cwagent.sh",
      "${path.root}/scripts/build/install-cdagent.sh",
      "${path.root}/scripts/build/force-user-data-single.sh"
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }
}
