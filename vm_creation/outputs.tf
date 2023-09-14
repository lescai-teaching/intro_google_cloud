output "instance_id" {
  description = "ID of the EC2 instance"
  value       = ["${google_compute_instance.test-rstudio.*.id}"]
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = ["${google_compute_instance.test-rstudio.*.public_ip}"]
}