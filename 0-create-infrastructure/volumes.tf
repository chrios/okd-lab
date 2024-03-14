# These are the templates for the further machines
resource "libvirt_volume" "debian_12" {
  name = "debian_12"
  source = "file:///mnt/data/iso/debian-12-genericcloud-amd64.qcow2"
  pool    = "vms"
  format  = "qcow2"
}

# These are 'helper' machines for the network

resource "libvirt_volume" "okd_loadbalancer0" {
  name = "okd-loadbalancer0.qcow2"
  base_volume_id = libvirt_volume.debian_12.id
  pool = "vms"
  format = "qcow2"
  base_volume_pool = "vms"
}

resource "libvirt_volume" "okd_dns0" {
  name = "okd-dns0.qcow2"
  base_volume_id = libvirt_volume.debian_12.id
  pool = "vms"
  format = "qcow2"
  base_volume_pool = "vms"
}

resource "libvirt_volume" "okd_dns1" {
  name = "okd-dns1.qcow2"
  base_volume_id = libvirt_volume.debian_12.id
  pool = "vms"
  format = "qcow2"
  base_volume_pool = "vms"
}

resource "libvirt_volume" "okd_web0" {
  name = "okd-web0.qcow2"
  base_volume_id = libvirt_volume.debian_12.id
  pool = "vms"
  format = "qcow2"
  base_volume_pool = "vms"
}

resource "libvirt_volume" "okd_web1" {
  name = "okd-web1.qcow2"
  base_volume_id = libvirt_volume.debian_12.id
  pool = "vms"
  format = "qcow2"
  base_volume_pool = "vms"
}

resource "libvirt_volume" "okd_nfs0" {
  name = "okd-nfs0.qcow2"
  base_volume_id = libvirt_volume.debian_12.id
  pool = "vms"
  format = "qcow2"
  base_volume_pool = "vms"
}

resource "libvirt_volume" "okd_nfs1" {
  name = "okd-nfs1.qcow2"
  base_volume_id = libvirt_volume.debian_12.id
  pool = "vms"
  format = "qcow2"
  base_volume_pool = "vms"
}



