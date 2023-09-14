# Introduction to Google Cloud Platform

This material is supporting a hands-on introduction to Google Cloud Platform, at the Department of Biology and Biotechnology "L. Spallanzani", University of Pavia.

The intro will cover the following topics:

- [Configuration of your project](#configuring-your-project)
- [Creating virtual machines](#creating-virtual-machines)
- [Running Nextflow on Google Batch](#running-nextflow)

The following paragraphs will briefly outline and link the available material.

## Configuring your project

The steps to configure your project are needed only if you haven't done this previously, and should only be run once per each project.
They are meant to allow users to run [nextflow](https://www.nextflow.io) on that project, by enabling the necessary APIs and creating a service account with the necessary permissions.

You will find the following scripts:
- [how to configure your project](./project_configuration/configure_project.sh)
- [how to export service account key](./project_configuration/export_service-account_key.sh)


## Creating Virtual Machines

The workshop will cover how to create a virtual machine through the console.
However, two different scripts will be demonstrated:

- [create a VM with google CLI](./vm_creation/create_vm_with-docker.sh)
- [create a VM using Terraform](./vm_creation/create_vm_with-docker.tf)

[Terraform](https://www.terraform.io) is a very powerful structured tool to handle *infrastructure as a code*.

## Running Nextflow

Nextflow can be run on Google Cloud Platform using the *lifesciences* API (which will be retired soon), or the new *Batch* API.
Using the latter, a user can benefit of the latest innovations in Nextflow such as [wave](https://www.nextflow.io/docs/latest/wave.html) and [fusion](https://www.nextflow.io/docs/latest/fusion.html).

Here you can find:
- a brief [script](./nextflow_testing/setup_master_vm.sh) to setup the virtual machine to be used to launch a pipeline
- the skeleton of a [config](./nextflow_testing/google_lifesciences.config) to use google lifesciences api
- the skeleton of a [config](./nextflow_testing/google_batch.config) to use google batch api



