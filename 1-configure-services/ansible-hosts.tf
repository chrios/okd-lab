resource "ansible_host" "okd-dns-0" {
  name = "10.10.56.2"
  groups = ["insecure_hosts"]
}

resource "ansible_host" "okd-dns-1" {
  name = "10.10.56.3"
  groups = ["insecure_hosts"]
}

resource "ansible_host" "okd-loadbalancer-0" {
  name = "10.10.56.253"
  groups = ["insecure_hosts"]
}

resource "ansible_host" "okd-web-0" {
  name = "10.1.56.4"
  groups = ["insecure_hosts"]
}

resource "ansible_host" "okd-nfs-0" {
  name = "10.10.56.6"
  groups = ["insecure_hosts"]
}
