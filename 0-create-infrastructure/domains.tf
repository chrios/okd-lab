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
    mac = "DE:AD:BE:EF:00:2"
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
    mac = "DE:AD:BE:EF:00:3"
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
    mac = "DE:AD:BE:EF:02:53"
    addresses = ["10.10.56.253"]
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
    mac = "DE:AD:BE:EF:00:04"
    addresses = ["10.10.56.4"]
  }
} 

resource "libvirt_domain" "okdDhcp0" {
  name            = "okdDhcp0"
  vcpu            = 2
  memory          = 4000
  cloudinit = libvirt_cloudinit_disk.cloud_init-ansibleinit.id
  disk {
    volume_id = libvirt_volume.okd_dhcp0.id
    scsi = true
  }
  network_interface {
    network_id = libvirt_network.okd_net.id
    hostname = "okd-dhcp-0"
    mac = "DE:AD:BE:EF:00:05"
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
    mac = "DE:AD:BE:EF:00:06"
    addresses = ["10.10.56.6"]
  }
} 
