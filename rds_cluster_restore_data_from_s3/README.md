AWS RDS CLUSTER
===========

Terraform module for creating RDS Cluster (Aurora MySQL) - from S3 location. 

Terraform supports this functionality in v1.17.0 terraform version.

----------------------


Usage
-----

```

module "aurora_cluster" {
  source                           = "git::https://github.com/sanjeet-deshpande//tf-aws-aurora.git//rds_cluster_restore_data_from_s3?ref=v0.0.4"
  comp_vars                        = "${var.comp_vars}"
  comp_product_service             = "${var.comp_product_service}"
  environment                      = "${var.environment}"
  role                             = "${var.role}"
  subnets                          = "${var.subnets}"
  vpc_id                           = "${var.vpc_id}"
  cluster_size                     = "${var.cluster_size}"
  aws_security_groups              = ["${var.aws_security_groups}"]
  database_name                    = "${var.database_name}"
  master_username                  = "${var.master_username}"
  master_password                  = "${var.master_password}"
  backup_retention_period          = "${var.backup_retention_period}"
  preferred_backup_window          = "${var.preferred_backup_window}"
  aurora_cluster_name              = "${var.aurora_cluster_name}"
  db_cluster_parameter_group_name  = "${module.aurora_cluster_parameter_group.aws_rds_cluster_parameter_group_id}"
  db_subnet_group_name             = "${module.aurora_db_subnet_group.rds_db_subnet_group_id}"
  kms_key_id                       = "${module.aurora_kms_key.aws_kms_key_arn}"
  s3_import {
     source_engine         = "${var.source_engine}"
     source_engine_version = ${var.source_engine_version}"
     bucket_name           = "${var.s3_bucket_name}"
     bucket_prefix         = "${var.s3_prefix}"
     ingestion_role        = "{var.ingestion_role_arn}"
  }
}
OR 
module "aurora_cluster" {
  source                           = "../sanjeet-deshpande/tf-aws-aurora/rds_cluster_restore_data_from_s3"
  comp_vars                        = "${var.comp_vars}"
  comp_product_service             = "${var.comp_product_service}"
  environment                      = "${var.environment}"
  role                             = "${var.role}"
  subnets                          = "${var.subnets}"
  vpc_id                           = "${var.vpc_id}"
  cluster_size                     = "${var.cluster_size}"
  aws_security_groups              = ["${var.aws_security_groups}"]
  database_name                    = "${var.database_name}"
  master_username                  = "${var.master_username}"
  master_password                  = "${var.master_password}"
  backup_retention_period          = "${var.backup_retention_period}"
  preferred_backup_window          = "${var.preferred_backup_window}"
  aurora_cluster_name              = "${var.aurora_cluster_name}"
  db_cluster_parameter_group_name  = "${module.aurora_cluster_parameter_group.aws_rds_cluster_parameter_group_id}"
  db_subnet_group_name             = "${module.aurora_db_subnet_group.rds_db_subnet_group_id}"
  kms_key_id                       = "${var.kms_key_id}"
  s3_import {
     source_engine         = "${var.source_engine}"
     source_engine_version = ${var.source_engine_version}"
     bucket_name           = "${var.s3_bucket_name}"
     bucket_prefix         = "${var.s3_prefix}"
     ingestion_role        = "{var.ingestion_role_arn}"	
  }
}
```
