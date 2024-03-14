
# These are the OKD machines
resource "libvirt_domain" "okdBootstrap" {
  name            = "okdBootstrap"
  vcpu            = 4
  memory          = 16000
  disk {
    volume_id = libvirt_volume.okd_bootstrap.id
    scsi = true
  }
  network_interface {
    network_id = libvirt_network.okd_net.id
    hostname = "okd-bootstrap"
    mac = "DE:AD:BE:EF:00:40"
    addresses = ["10.10.56.10"]
  }
  running = false
} 

resource "libvirt_domain" "okdController" {
  name            = "okdController${count.index}"
  vcpu            = 4
  memory          = 16000
  count           = 2
  autostart       = true
  disk {
    volume_id       = libvirt_volume.okd_controller[count.index].id
    scsi            = true
  }
  network_interface {
    network_id      = libvirt_network.okd_net.id
    hostname        = "okd-controller-${count.index}"
    mac = "DE:AD:BE:EF:00:2${count.index}"
    addresses = ["10.10.56.2${count.index}"]
  }
  running = false
}

resource "libvirt_domain" "okdWorker" {
  name            = "okdWorker${count.index}"
  vcpu            = 4
  memory          = 16000
  count           = 3
  autostart       = true
  disk {
    volume_id       = libvirt_volume.okd_worker[count.index].id
    scsi            = true
  }
  network_interface {
    network_id      = libvirt_network.okd_net.id
    hostname        = "okd-worker-${count.index}"
    mac = "DE:AD:BE:EF:00:3${count.index}"
    addresses = ["10.10.56.3${count.index}"]
  }
  running = false
}