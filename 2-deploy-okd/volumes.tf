# These are the templates for the further machines
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
