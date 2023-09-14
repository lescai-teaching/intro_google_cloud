output "instance_id" {
  description = "ID of the EC2 instance"
  value       = ["${google_compute_instance.test-rstudio.*.instance_id}"]
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = ["${google_compute_instance.test-rstudio.*.network_interface.0.access_config.0.nat_ip}"]
}