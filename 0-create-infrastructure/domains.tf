# These are the 'helper' machines
resource "libvirt_domain" "okdDns0" {
  name            = "okdDns0"
  vcpu            = 2
  memory          = 4000
  cloudinit = libvirt_cloudinit_disk.cloud_init-ansibleinit.id
  disk {
    volume_id = libvirt_volume.okd_dns0.id
    scsi = true
  }
  network_interface {
    network_id = libvirt_network.okd_net.id
    hostname = "okd-dns-0"
    addresses = ["10.10.56.2"]
  }
} 

resource "libvirt_domain" "okdDns1" {
  name            = "okdDns1"
  vcpu            = 2
  memory          = 4000
  cloudinit = libvirt_cloudinit_disk.cloud_init-ansibleinit.id
  disk {
    volume_id = libvirt_volume.okd_dns1.id
    scsi = true
  }
  network_interface {
    network_id = libvirt_network.okd_net.id
    hostname = "okd-dns-1"
    addresses = ["10.10.56.3"]
  }
} 

resource "libvirt_domain" "okdLoadblancer0" {
  name            = "okdLoadbalancer0"
  vcpu            = 2
  memory          = 4000
  cloudinit = libvirt_cloudinit_disk.cloud_init-ansibleinit.id
  disk {
    volume_id = libvirt_volume.okd_loadbalancer0.id
    scsi = true
  }
  network_interface {
    network_id = libvirt_network.okd_net.id
    hostname = "okd-loadbalancer-0"
    addresses = ["10.10.56.253"]
  }
} 

resource "libvirt_domain" "okdLoadblancer1" {
  name            = "okdLoadbalancer1"
  vcpu            = 2
  memory          = 4000
  cloudinit = libvirt_cloudinit_disk.cloud_init-ansibleinit.id
  disk {
    volume_id = libvirt_volume.okd_loadbalancer1.id
    scsi = true
  }
  network_interface {
    network_id = libvirt_network.okd_net.id
    hostname = "okd-loadbalancer-1"
    addresses = ["10.10.56.254"]
  }
} 

resource "libvirt_domain" "okdWeb0" {
  name            = "okdWeb0"
  vcpu            = 2
  memory          = 4000
  cloudinit = libvirt_cloudinit_disk.cloud_init-ansibleinit.id
  disk {
    volume_id = libvirt_volume.okd_web0.id
    scsi = true
  }
  network_interface {
    network_id = libvirt_network.okd_net.id
    hostname = "okd-web-0"
    addresses = ["10.10.56.4"]
  }
}  

resource "libvirt_domain" "okdWeb1" {
  name            = "okdWeb1"
  vcpu            = 2
  memory          = 4000
  cloudinit = libvirt_cloudinit_disk.cloud_init-ansibleinit.id
  disk {
    volume_id = libvirt_volume.okd_web1.id
    scsi = true
  }
  network_interface {
    network_id = libvirt_network.okd_net.id
    hostname = "okd-web-1"
    addresses = ["10.10.56.5"]
  }
}  

resource "libvirt_domain" "okdNFS0" {
  name            = "OkdNFS0"
  vcpu            = 2
  memory          = 4000
  cloudinit = libvirt_cloudinit_disk.cloud_init-ansibleinit.id
  disk {
    volume_id = libvirt_volume.okd_nfs0.id
    scsi = true
  }
  network_interface {
    network_id = libvirt_network.okd_net.id
    hostname = "okd-nfs-0"
    addresses = ["10.10.56.6"]
  }
} 


resource "libvirt_domain" "okdNFS1" {
  name            = "OkdNFS1"
  vcpu            = 2
  memory          = 4000
  cloudinit = libvirt_cloudinit_disk.cloud_init-ansibleinit.id
  disk {
    volume_id = libvirt_volume.okd_nfs1.id
    scsi = true
  }
  network_interface {
    network_id = libvirt_network.okd_net.id
    hostname = "okd-nfs-1"
    addresses = ["10.10.56.7"]
  }
} 


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
    
    addresses = ["10.10.56.10${count.index}"]
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
    addresses = ["10.10.56.3${count.index}"]
  }
  running = false
}