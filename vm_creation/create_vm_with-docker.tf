# validate code on
# https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

resource "google_compute_instance" "test-rstudio" {

  count        = var.instance_count
  machine_type = var.instance_type # "e2-standard-2"
  project      = "YOUR-PROJECT-NAME"
  name         = "test-rstudio-${count.index}"
  boot_disk {
    auto_delete = true
    initialize_params {
      image = "projects/cos-cloud/global/images/cos-stable-105-17412-156-34"
      size  = 100
      type  = "pd-balanced"
    }
    mode = "READ_WRITE"
  }
  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    container-vm = "cos-stable-105-17412-156-34"
    goog-ec-src  = "vm_add-tf"
  }

  metadata = {
    gce-container-declaration = "spec:\n  containers:\n  - name: rstudio-server\n    image: ghcr.io/rocker-org/verse:4.3.1\n    env:\n    - name: DISABLE_AUTH\n      value: 'true'\n    stdin: false\n    tty: false\n  restartPolicy: Always\n# This container declaration format is not public API and may change without notice. Please\n# use gcloud command-line tool or Google Cloud Console to run Containers on Google Compute Engine."
  }

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/YOUR-PROJECT-NAME/regions/europe-west4/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "YOUR-COMPUTE-SERVICE-ACCOUNT" ## use 'gcloud iam service-accounts list'
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags = ["rstudio"]
  zone = "europe-west4-a"
}


variable "instance_count" {
  type = number
  default = 1
}

variable "instance_type" {
  default = "e2-standard-2"
}