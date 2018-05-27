variable "environment" {
  description = "environment name whether its staging or prod for tagging."
}

variable "comp_product_service" {
  description = "Enter product service"
}

variable "role" {
  description = "Enter the role name"
}

variable "comp_vars" {
  type        = "map"
  description = "Company Global variables"
}

variable "subnets" {
  description = "A comma separated list of Subnets to use in creating RDS subnet group (must already exist)"
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group."
}
