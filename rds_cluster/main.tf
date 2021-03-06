data "aws_vpc" "vpc" {
  id = "${var.vpc_id}"
}

data "template_file" "name_prefix_tpl" {
  template = "$${aws_region_short}$${short_env}$${comp_product_short}${var.comp_product_service}"

  vars {
    aws_region_short   = "${var.comp_vars["aws_region_short"]}"
    short_env          = "${var.comp_vars["short_env"]}"
    comp_product_short = "${var.comp_vars["comp_product_short"]}"
  }
}

resource "aws_rds_cluster" "aurora" {
  cluster_identifier      = "${data.template_file.name_prefix_tpl.rendered}-${var.aurora_cluster_name}"
  database_name           = "${var.database_name}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  backup_retention_period = "${var.backup_retention_period}"
  preferred_backup_window = "${var.preferred_backup_window}"
  vpc_security_group_ids  = ["${var.aws_security_groups}"]
  storage_encrypted       = "${var.storage_encrypted}"

  kms_key_id = "${var.kms_key_id}"

  #kms_key_id                      = "arn:aws:kms:us-east-1:086761730243:key/b8a73912-620a-4501-b278-cfae47657107"
  apply_immediately               = "${var.apply_immediately}"
  db_subnet_group_name            = "${var.db_subnet_group_name}"
  db_cluster_parameter_group_name = "${var.db_cluster_parameter_group_name}"
  final_snapshot_identifier       = "final-snapshot-${data.template_file.name_prefix_tpl.rendered}-${var.aurora_cluster_name}"

  skip_final_snapshot = "${var.skip_final_snapshot}"
  engine              = "${var.rds_cluster_engine}"
  engine_version      = "${var.rds_cluster_engine_version}"
  snapshot_identifier = "${var.snapshot_identifier}"

  lifecycle {
    prevent_destroy = "false" # https://www.terraform.io/docs/configuration/resources.html#prevent_destroy
  }

  tags {
    "Name"             = "${data.template_file.name_prefix_tpl.rendered}-${var.aurora_cluster_name}"
    "Role"             = "${var.role}"
    "role"        = "${var.role}"
    "product"     = "${var.comp_vars["product"]}"
    "family"      = "${var.comp_vars["family"]}"
    "service"     = "${var.comp_vars["service_tag"]}"
    "environment" = "${var.environment}"
    "moniker"     = "${var.comp_vars["moniker"]}"
  }
}
