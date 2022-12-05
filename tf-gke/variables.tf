variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

variable "zone" {
    type = string
    default = "us-central1-a"
}

variable "terraform_service_account" {
    type = string
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}

variable "default_service_account" {
  type = string
  description = "default service account"
}
