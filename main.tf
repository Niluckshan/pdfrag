provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
  credentials = "./credentials.json"
}

resource "google_compute_address" "static_ip" {
  name   = var.static_ip_name
  region = var.region
}

module "vm" {
  source = "./modules/vm"

  static_nat_ip = google_compute_address.static_ip.address
}