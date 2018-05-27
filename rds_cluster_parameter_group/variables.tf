variable "environment" {}

variable "comp_vars" {
  type        = "map"
  description = "Company Global variables"
}

variable "cluster_parameters" {
  description = "A list of cluster parameter maps to apply"
  type        = "list"
  default     = []
}

variable "comp_product_service" {
  description = "Enter product service"
}

variable "role" {
  description = "Enter the role name"
}

variable "cluster_parameter_group_name" {
  description = "The name of the DB cluster parameter group."
}

variable "cluster_parameter_group_family" {
  description = "The family of the DB cluster parameter group."
  default     = "aurora5.6"
}
