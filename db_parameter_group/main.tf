data "template_file" "name_prefix_tpl" {
  template = "$${aws_region_short}$${short_env}$${comp_product_short}${var.comp_product_service}"

  vars {
    aws_region_short   = "${var.comp_vars["aws_region_short"]}"
    short_env          = "${var.comp_vars["short_env"]}"
    comp_product_short = "${var.comp_vars["comp_product_short"]}"
  }
}

resource "aws_db_parameter_group" "db_parameter_group" {
  name        = "${data.template_file.name_prefix_tpl.rendered}-${var.db_parameter_group_name}"
  family      = "${var.db_parameter_family}"
  description = "Managed by Terraform - ${data.template_file.name_prefix_tpl.rendered}-${var.db_parameter_group_name}"

  parameter = ["${var.db_parameters}"]

  tags {
    "Name"             = "${data.template_file.name_prefix_tpl.rendered}-${var.db_parameter_group_name}"
    "Role"             = "${var.role}"
    "role"        = "${var.role}"
    "product"     = "${var.comp_vars["product"]}"
    "family"      = "${var.comp_vars["family"]}"
    "service"     = "${var.comp_vars["service_tag"]}"
    "environment" = "${var.environment}"
    "moniker"     = "${var.comp_vars["moniker"]}"
  }
}
