
data "template_file" "cloud_init-ansibleinit" {
  template = file("${path.module}/cloud_init-ansibleinit.cfg")
}

resource "libvirt_cloudinit_disk" "cloud_init-ansibleinit" {
  name = "cloud_init-ansibleinit"
  user_data = data.template_file.cloud_init-ansibleinit.rendered
  pool = "iso"
}