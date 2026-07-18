resource "google_compute_network" "this" {
  project                         = var.project_id
  name                            = var.name
  description                     = var.description
  routing_mode                    = var.routing_mode
  auto_create_subnetworks         = var.auto_create_subnetworks
  mtu                             = var.mtu
  delete_default_routes_on_create = var.delete_default_routes_on_create
}
