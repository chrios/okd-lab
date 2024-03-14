
resource "libvirt_network" "okd_net" {
  name = "okdnet"
  mode = "nat"
  domain = "okd.home.mawson.tech"
  addresses = ["10.10.56.0/24"]
  bridge = "okdbr0"
  dns {
      enabled = true
      local_only = false
  }
  autostart = true
}

