variable "comp_vars" {
  type        = "map"
  description = "Company Global variables"
}

variable "environment" {
  description = "environment name whether its staging or prod for tagging."
}

variable "db_parameters" {
  description = "A list of db parameter maps to apply"
  type        = "list"
  default     = []
}

variable "comp_product_service" {
  description = "Enter product service"
}

variable "db_parameter_group_name" {
  description = "DB Parameter Group Name"
}

variable "db_parameter_family" {
  description = "The family of the DB parameter group."
  default     = "aurora5.6"
}

variable "role" {
  description = "Enter the role name"
}
