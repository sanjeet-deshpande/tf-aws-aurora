data "template_file" "name_prefix_tpl" {
  template = "$${aws_region_short}$${short_env}$${comp_product_short}${var.comp_product_service}"

  vars {
    aws_region_short   = "${var.comp_vars["aws_region_short"]}"
    short_env          = "${var.comp_vars["short_env"]}"
    comp_product_short = "${var.comp_vars["comp_product_short"]}"
  }
}

resource "aws_rds_cluster_instance" "cluster_instance" {
  count      = "${var.cluster_size}"
  identifier = "${data.template_file.name_prefix_tpl.rendered}-${var.instance_identifier}-${count.index}"

  cluster_identifier      = "${var.cluster_identifier}"
  instance_class          = "${var.instance_class}"
  publicly_accessible     = "${var.publicly_accessible}"
  db_parameter_group_name = "${var.db_parameter_group_name}"
  promotion_tier          = "${var.promotion_tier}"
  engine_version          = "${var.engine_version}"
  auto_minor_version_upgrade = "${var.auto_minor_version_upgrade}"
  tags {
    "Name"             = "${data.template_file.name_prefix_tpl.rendered}${format("%02d", count.index + 1)}"
    "Role"             = "${var.role}"
    "role"        = "${var.role}"
    "product"     = "${var.comp_vars["product"]}"
    "family"      = "${var.comp_vars["family"]}"
    "service"     = "${var.comp_vars["service_tag"]}"
    "environment" = "${var.environment}"
    "moniker"     = "${var.comp_vars["moniker"]}"
  }
}
