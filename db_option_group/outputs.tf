output "rds_db_option_group_id" {
  value = "${aws_db_option_group.db_option_group.id}"
}

output "rds_db_option_group_arn" {
  value = "${aws_db_option_group.db_option_group.arn}"
}
