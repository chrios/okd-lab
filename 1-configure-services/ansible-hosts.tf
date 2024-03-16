resource "ansible_host" "okd-dns-0" {
  name = "10.10.56.2"
}

resource "ansible_host" "okd-dns-1" {
  name = "10.10.56.3"
}

resource "ansible_host" "okd-web-0" {
  name = "10.1.56.4"
}

resource "ansible_host" "okd-web-1" {
  name = "10.1.56.5"
}

resource "ansible_host" "okd-loadbalancer-0" {
  name = "10.10.56.253"
}

resource "ansible_host" "okd-loadbalancer-1" {
  name = "10.10.56.254"
}
