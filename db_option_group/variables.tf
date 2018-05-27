variable "comp_vars" {
  type        = "map"
  description = "Company Global variables"
}

variable "environment" {
  description = "environment name whether its staging or prod for tagging."
}

variable "comp_product_service" {
  description = "Enter product service"
}

variable "role" {
  description = "Enter the role name"
}

variable "db_option_group_name" {
  description = "Aurora DB Option Group Name"
}

variable "db_engine_name" {
  description = "DB Engine Name"
  default     = "aurora"
}

variable "db_engine_version" {
  description = "DB Engine version"
  default     = "5.6"
}
