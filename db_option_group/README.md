AWS DB OPTION GROUP
===========

Terraform module for creating DB Option Group

----------------------

Usage
-----

```

module "aurora_db_option_group" {
 source = "git::https://github.com/sanjeet-deshpande//tf-aws-aurora.git//db_option_group?ref=v0.0.1"
 comp_vars   = "${var.comp_vars}"
 comp_product_service    = "${var.comp_product_service}"
 role                    = "${var.role}"
 environment             = "${var.environment}"
 db_engine_name          = "${var.db_engine_name}"
 db_engine_version       = "${var.db_engine_version}"
 db_option_group_name    = "${var.db_option_group_name}"
}

```

