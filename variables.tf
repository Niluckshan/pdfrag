variable "project_id" {
  type        = string
  default     = "project-trial-420614"
}

variable "region" {
  type        = string
  default     = "europe-west6"
}

variable "zone" {
  type        = string
  default     = "europe-west6-b"
}

variable "static_ip_name" {
  type        = string
  default     = "rag-vm-static-ip"
  description = "Name of the reserved static external IP"
}