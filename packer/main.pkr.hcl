build {
  name    = "aws"
  sources = ["source.amazon-ebs.ubuntu-app"]

  provisioner "shell" {
    inline = [
      "cloud-init status --wait",
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }

  provisioner "shell" {
    scripts = [
      "${path.root}/scripts/upgrade-apt.sh",
      "${path.root}/scripts/install-common-tools.sh",
      "${path.root}/scripts/install-docker.sh"
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }
}


build {
  name    = "aws"
  sources = ["source.amazon-ebs.ubuntu-infra"]

  provisioner "shell" {
    inline = [
      "cloud-init status --wait",
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }

  provisioner "shell" {
    scripts = [
      "${path.root}/scripts/upgrade-apt.sh",
      "${path.root}/scripts/install-common-tools.sh",
      "${path.root}/scripts/install-docker.sh"
    ]
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }
}
