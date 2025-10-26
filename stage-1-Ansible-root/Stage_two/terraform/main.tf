terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

provider "null" {}

resource "null_resource" "vagrant_up" {
  provisioner "local-exec" {
    command = "vagrant up"
  }
}

resource "null_resource" "ansible_provision" {
  depends_on = [null_resource.vagrant_up]

  provisioner "local-exec" {
    command = "ansible-playbook -i ../ansible/inventory.ini ../ansible/playbook.yaml --become --ask-become-pass"
  }
}
