
resource "ansible_playbook" "okd-dns-0" {
  playbook = "playbooks/okd-dns-0.yml"
  name = ansible_host.okd-dns-0.name
  replayable = true
  extra_vars = {
    ansible_ssh_extra_args = "-oStrictHostKeyChecking=no"
  }
}

resource "ansible_playbook" "okd-dns-1" {
  playbook = "playbooks/okd-dns-1.yml"
  name = ansible_host.okd-dns-1.name
  replayable = true
  extra_vars = {
    ansible_ssh_extra_args = "-oStrictHostKeyChecking=no"
  }
}

//resource "ansible_playbook" "okd-dhcp-0" {
//  playbook = "playbooks/okd-dhcp-0.yml"
//  name = "ansible_host.okd-dhcp-0.name"
//  replayable = true
//}
//resource "ansible_playbook" "okd-loadbalancer-0" {
//  playbook = "playbooks/okd-loadbalancer-0.yml"
//  name = "ansible_host.okd-loadbalancer-0.name"
//  replayable = true
//}
//
//resource "ansible_playbook" "okd-nfs-0" {
//  playbook = "playbooks/okd-nfs-0.yml"
//  name = "ansible_host.okd-nfs-0.name"
//  replayable = true
//}
//
//resource "ansible_playbook" "okd-web-0" {
//  playbook = "playbooks/okd-web-0.yml"
//  name = "ansible_host.okd-web-0.name"
//  replayable = true
//}