variable "project_id" {
  description = "ID of the project in which to create the VPC network."
  type        = string
}

variable "name" {
  description = "Name of the VPC network."
  type        = string
}

variable "routing_mode" {
  description = "Network-wide routing mode: REGIONAL or GLOBAL."
  type        = string
  default     = "REGIONAL"

  validation {
    condition     = contains(["REGIONAL", "GLOBAL"], var.routing_mode)
    error_message = "routing_mode must be either REGIONAL or GLOBAL."
  }
}

variable "auto_create_subnetworks" {
  description = "Whether to create a subnetwork in every region automatically. Set false for custom-mode networks."
  type        = bool
  default     = false
}

variable "mtu" {
  description = "Maximum transmission unit in bytes for the network, between 1300 and 8896."
  type        = number
  default     = 1460

  validation {
    condition     = var.mtu >= 1300 && var.mtu <= 8896
    error_message = "mtu must be between 1300 and 8896."
  }
}

variable "delete_default_routes_on_create" {
  description = "Whether to delete the default routes (0.0.0.0/0) to the internet when the network is created."
  type        = bool
  default     = false
}

variable "description" {
  description = "Optional description for the VPC network."
  type        = string
  default     = null
}
