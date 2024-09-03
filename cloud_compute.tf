resource "google_compute_instance" "main" {
  name         = "my-vm"
  machine_type = "e2-medium"
  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.SSH_Key)}"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-2210-kinetic-amd64-v20230126"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
##printing ip address of newly created vm
output "VM_public_ip_address_gcp" {
  value = google_compute_instance.main.network_interface[0].access_config[0].nat_ip

}
