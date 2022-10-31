provider "google" {
  version     = "3.5.0"
  credentials = file(var.cred)
  project     = var.project
  region      = var.region
  zone        = var.zone
}

module "network" {
  source = "./modules/networks/"
  region = var.region
}


module "VM" {
  source = "./modules/VM/"
  range = var.range
  type = var.type
  network = module.network.ntwrk
  subnetwork = module.network.subntwrk
}

