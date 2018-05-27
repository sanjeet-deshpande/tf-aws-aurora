data "template_file" "name_prefix_tpl" {
  template = "$${aws_region_short}$${short_env}$${comp_product_short}${var.comp_product_service}"

  vars {
    aws_region_short   = "${var.comp_vars["aws_region_short"]}"
    short_env          = "${var.comp_vars["short_env"]}"
    comp_product_short = "${var.comp_vars["comp_product_short"]}"
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name        = "${data.template_file.name_prefix_tpl.rendered}-${var.db_subnet_group_name}"
  description = "Managed by Terraform - ${data.template_file.name_prefix_tpl.rendered}-${var.db_subnet_group_name}"
  subnet_ids  = "${split(",", var.subnets)}"

  tags {
    "Name"             = "${data.template_file.name_prefix_tpl.rendered}-${var.db_subnet_group_name}"
    "Role"             = "${var.role}"
    "role"        = "${var.role}"
    "product"     = "${var.comp_vars["product"]}"
    "family"      = "${var.comp_vars["family"]}"
    "service"     = "${var.comp_vars["service_tag"]}"
    "environment" = "${var.environment}"
    "moniker"     = "${var.comp_vars["moniker"]}"
  }
}
