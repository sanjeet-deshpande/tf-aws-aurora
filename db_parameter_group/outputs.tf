output "rds_db_parameter_group_id" {
  value = "${aws_db_parameter_group.db_parameter_group.id}"
}

output "rds_db_parameter_group_arn" {
  value = "${aws_db_parameter_group.db_parameter_group.arn}"
}
