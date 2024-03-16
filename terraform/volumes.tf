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

resource "libvirt_volume" "okd_loadbalancer1" {
  name = "okd-loadbalancer1.qcow2"
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

# the templates for the OKD  machines
resource "libvirt_volume" "fedora_coreos" {
  name    = "fedora_coreos.qcow2"
  source  = "file:///mnt/data/iso/fedora-coreos-39.20240210.3.0-qemu.x86_64.qcow2"
  pool    = "vms"
  format  = "qcow2"
}

# These are the OKD machines
resource "libvirt_volume" "okd_bootstrap" {
  name              = "okd-bootstrap.qcow2"
  base_volume_id    = libvirt_volume.fedora_coreos.id
  pool              = "vms"
  format            = "qcow2"
  base_volume_pool  = "vms"
}

resource "libvirt_volume" "okd_controller" {
  name              = "okd-controller-${count.index}.qcow2"
  base_volume_id    = libvirt_volume.fedora_coreos.id
  count             = 2
  pool              = "vms"
  format            = "qcow2"
  base_volume_pool  = "vms"
}

resource "libvirt_volume" "okd_worker" {
  name              = "okd-worker-${count.index}.qcow2"
  base_volume_id    = libvirt_volume.fedora_coreos.id
  count             = 3
  pool              = "vms"
  format            = "qcow2"
  base_volume_pool  = "vms"
}
