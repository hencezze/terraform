resource "google_compute_network" "vpc_network" {
  name = var.network
}

resource "google_compute_subnetwork" "public-subnetwork" {
  name          = var.subnetwork
  ip_cidr_range = var.range
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "icmp" {
  name = "allow-icmp"
  allow {
    protocol = "icmp"
  }
  network = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "http" {
  name = "allow-http"
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
   network = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "https" {
  name = "allow-https"
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

   network = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "RDP" {
  name = "allow-rdp"
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
   network = google_compute_network.vpc_network.id
}


