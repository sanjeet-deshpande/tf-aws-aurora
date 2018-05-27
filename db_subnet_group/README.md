AWS DB SUBNET GROUP
===========

Terraform module for RDS DB Subnet group.

----------------------

Usage
-----

```
module "aurora_db_subnet_group" {
  source                  = "git::https://github.com/sanjeet-deshpande//tf-aws-aurora.git//db_subnet_group?ref=v0.0.1"
  comp_vars               = "${var.comp_vars}"
  comp_product_service    = "${var.comp_product_service}"
  role                    = "${var.role}"
  environment             = "${var.environment}"
  subnets                 = "${var.subnets}"
  db_subnet_group_name    = "${var.db_subnet_group_name}"
}
```
