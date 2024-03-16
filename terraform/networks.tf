
resource "libvirt_network" "okd_net" {
  name = "okdnet"
  mode = "nat"
  domain = "okd.home.mawson.tech"
  addresses = ["10.10.56.0/24"]
  bridge = "okdbr0"
  dns {
      enabled = true
      local_only = false
      forwarders {
        address = "10.10.56.2"
        domain = "okd.home.mawson.tech"
      }
      forwarders {
        address = "10.10.56.3"
        domain = "okd.home.mawson.tech"
      }
  }
  autostart = true
}

