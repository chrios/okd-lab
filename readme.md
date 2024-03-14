This will perform the following:

- Create an isolated libvirt network 10.10.56.0/24 to host the lab
- Create a cloud-init ISO image to setup an ansible user on the debian machines
- Create a debian 12 cloud image to host DNS  (okd-dns0)
- Create a debian 12 cloud image to host haproxy (okd-haproxy-0)
- Create a debian 12 cloud image to host web services (okd-web-0)
- Create a debian 12 cloud image to host dhcp services (okd-dhcp-0)
- Create a debian 12 cloud image to host nfs services (okd-nfs-0)

- Ansible okd-dns0, install BIND, generate a BIND zone file that contains required DNS entries for OKD
- Ansible okd-dns1, install BIND, generate a BIND zone file that contains required DNS entries for OKD
- Ansible okd-loadbalancer0, install haproxy, generate a haproxy config file with required listeners
- Ansible okd-web0, install apache, generate apache config to server required files
- Ansible okd-web1, install apache, generate apache config to server required files
- Ansible okd-nfs0, install nfs utils, generate nfs config and apply
- Ansible okd-nfs1, install nfs utils, generate nfs config and apply






- Create a fedora coreos cloud image to host bootstrap (okd-bootstrap)
- Create 2 fedora coreos cloud image to host controller (okd-controller-n)
- Create 3 fedora coreos cloud image to host workers (okd-worker-n)