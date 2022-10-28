resource "google_compute_instance" "vm_instance" {
  name         = var.instance
  machine_type = var.type
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    access_config {}
  }
}
