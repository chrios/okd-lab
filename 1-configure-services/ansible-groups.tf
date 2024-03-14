resource "ansible_group" "insecure_hosts" {
  name = "insecure_hosts"
  children = ["okd-dns-0", "okd-dns-1"]
  variables = {
    ansible_ssh_extra_args = "-o StrictHostKeyChecking=no"
  }
}