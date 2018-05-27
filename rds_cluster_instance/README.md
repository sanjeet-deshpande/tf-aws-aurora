AWS RDS CLUSTER INSTANCE
===========

Terraform module to create a instance in a RDS cluster.


----------------------

Usage
-----

```

module "aurora_cluster_instance" {
  source                           = "git::https://github.com/sanjeet-deshpande//tf-aws-aurora.git//rds_cluster_instance?ref=v0.0.1"
  comp_vars                        = "${var.comp_vars}"
  comp_product_service             = "${var.comp_product_service}"
  environment                      = "${var.environment}"
  role                             = "${var.role}"
  instance_identifier              = "${var.instance_identifier}"
  cluster_identifier               = "${module.aurora_cluster.cluster_identifier}"
  db_subnet_group_name             = "${module.aurora_db_subnet_group.rds_db_subnet_group_id}"
  db_parameter_group_name          = "${module.aurora_db_parameter_group.rds_db_parameter_group_id}"
  monitoring_role_arn              = "${module.aurora_iam_role.aws_iam_role_arn}"
  cluster_size                     = "${var.cluster_size}"
}

```
