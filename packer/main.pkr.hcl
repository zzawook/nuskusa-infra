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
    source      = "${path.root}/aws/credentials"
    destination = "/home/ubuntu/.aws/credentials"
  }

  provisioner "file" {
    #Path to your own AWS config file
    source      = "${path.root}/aws/config"
    destination = "/home/ubuntu/.aws/config"
  }

  provisioner "shell" {
    inline = [
      "cloud-init status --wait",
      "export MYSQL_ROOT_PASSWORD=${var.MYSQL_ROOT_PASSWORD}",
      "export MYSQL_USER=${var.MYSQL_USER}",
      "export MYSQL_PASSWORD=${var.MYSQL_PASSWORD}"
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
    source      = "${path.root}/aws/credentials"
    destination = "/home/ubuntu/.aws/credentials"
  }

  provisioner "file" {
    #Path to your own AWS config file
    source      = "${path.root}/aws/config"
    destination = "/home/ubuntu/.aws/config"
  }

  provisioner "shell" {
    inline = [
      "cloud-init status --wait",
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
