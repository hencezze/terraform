output "ntwrk" {
  value = google_compute_network.vpc_network.id
  sensitive = true
}

output "subntwrk" {
  value = google_compute_subnetwork.public-subnetwork.name
  sensitive = true
}
