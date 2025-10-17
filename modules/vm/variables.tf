variable "vm_name" {
  type = string
  default = "rag" # Zurich
}

variable "machine_type" {
  type = string
  default = "f1-micro"
}

variable "os_image" {
  type = string
  default = "ubuntu-os-cloud/ubuntu-2204-lts"
}

variable "disk_size_gb" {
  type = number
  default = 10
}

variable "disk_type" {
  type = string
  default = "pd-standard"
}

variable "static_nat_ip" {
  type = string
  description = "Reserved external IP address to attach to the VM"
}