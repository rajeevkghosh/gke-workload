provider "google" {
  project = "airline1-sabre-wolverine"
  #credentials = file("../gke.json")
}

data "google_project" "project" {
project_id = "airline1-sabre-wolverine"

}
resource "google_container_cluster" "primary" {
  name               = "marcellus-wallace"
  location           = "us-central1-a"
  initial_node_count = 3
  datapath_provider  = "ADVANCED_DATAPATH"

  ip_allocation_policy {

  }
  release_channel {
    channel = "STABLE"
  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "192.168.10.35/32"
    }
  }

  workload_identity_config {
    workload_pool = "abc.svc.id.goog"
  }
  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    #service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      foo = "bar"
    }
    tags = ["foo", "bar"]
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
}