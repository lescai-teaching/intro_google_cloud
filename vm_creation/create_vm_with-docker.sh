gcloud compute \
    instances \
    create-with-container \
    test-rstudio \
    --project=YOUR-PROJECT-NAME \
    --zone=europe-west4-a \
	--machine-type=e2-standard-8 \
	--network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
	--maintenance-policy=MIGRATE \
	--provisioning-model=STANDARD \
	--service-account=YOUR-COMPUTE-SERVICE-ACCOUNT \
	--scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
	--tags=rstudio \
	--image=projects/cos-cloud/global/images/cos-stable-105-17412-156-34 \
	--boot-disk-size=100GB --boot-disk-type=pd-balanced \
	--boot-disk-device-name=test-rstudio \
	--container-image=ghcr.io/rocker-org/verse:4.3.1 \
	--container-restart-policy=always --no-shielded-secure-boot \
	--shielded-vtpm \
	--shielded-integrity-monitoring \
	--labels=goog-ec-src=vm_add-gcloud,container-vm=cos-stable-105-17412-156-34