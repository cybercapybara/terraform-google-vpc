terraform {
  required_version = ">= 1.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source = "../.."

  project_id              = var.project_id
  name                    = "example-vpc"
  routing_mode            = "REGIONAL"
  auto_create_subnetworks = false
}

variable "project_id" {
  description = "Project ID to deploy the example VPC into."
  type        = string
}

variable "region" {
  description = "Region for the google provider."
  type        = string
  default     = "us-central1"
}

output "network_id" {
  value = module.vpc.id
}
