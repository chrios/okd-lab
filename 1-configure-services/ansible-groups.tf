resource "ansible_group" "insecure_hosts" {
  name = "insecure_hosts"
  variables = {
    ansible_ssh_extra_args = "-o StrictHostKeyChecking=no"
  }
}