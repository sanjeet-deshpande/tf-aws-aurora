AWS DB PARAMETER GROUP
===========

Terraform module for creating db parameter group

----------------------

Usage
-----

```

module "aurora_db_parameter_group" {
  source                  = "git::https://github.com/sanjeet-deshpande//tf-aws-aurora.git//db_parameter_group?ref=v0.0.1"
  comp_vars               = "${var.comp_vars}"
  comp_product_service    = "${var.comp_product_service}"
  role                    = "${var.role}"
  environment             = "${var.environment}"
  db_parameter_group_name = "${var.db_parameter_group_name}"
  db_parameter_family     = "${var.db_parameter_family}"
  db_parameters           = ["${var.db_parameters}"]
}

```
