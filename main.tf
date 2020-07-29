provider "google" {
  credentials = file("terraform.json")

  project = "academic-being-283513"
  region = "us-central1"
  zone = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance"{
    name = "terraform-instance"
    machine_type = "f1-micro"
    tags = ["web", "dev"]

    boot_disk{
      initialize_params{
        image = "ubuntu-os-cloud/ubuntu-1604-xenial-v20200722"
      }
    }
    


    network_interface{
      network = google_compute_network.vpc_network.name
      access_config{}
    }

}