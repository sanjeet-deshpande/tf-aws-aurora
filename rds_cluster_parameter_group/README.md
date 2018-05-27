AWS RDS CLUSTER PARAMETER GROUP
===========

Terraform module for Creating DB Cluster Parameter group.

----------------------
Usage
-----

```

module "aurora_cluster_parameter_group" {
  source                  = "git::https://github.com/sanjeet-deshpande//tf-aws-aurora.git//rds_cluster_parameter_group?ref=v0.0.1"
  comp_vars               = "${var.comp_vars}"
  comp_product_service    = "${var.comp_product_service}"
  role                    = "${var.role}"
  environment             = "${var.environment}"
  cluster_parameter_group_name = "${var.cluster_parameter_group_name}"
  cluster_parameters           = "${var.cluster_parameters}"
}
```
