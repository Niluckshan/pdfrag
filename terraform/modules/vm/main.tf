resource "google_compute_instance" "vm" {
  name = var.vm-name
  machine_type = var.machine-type
  tags = var.target-tags

  boot_disk {
    initialize_params {
      image = var.os-image
      size = var.disk-size-gb
      type = var.disk-type
    }
  }

  network_interface {
    network = var.network

    access_config {
      nat_ip = var.static-nat-ip
    }
  }

  service_account {
    email  = "terraform@project-trial-420614.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  metadata = {
    enable-oslogin = "TRUE"
    user-data = templatefile("${path.module}/templates/cloud-init.yaml.tftpl", {
      repo_url = "https://github.com/Niluckshan/pdfrag.git"
      app_dir = "/opt/app"
      project_name = "pdfrag"
      project_id = "project-trial-420614"
      image_tag = "8279e1ecf053e4233d1792e41da73cc97f1bbdb6"
    })
  }
}