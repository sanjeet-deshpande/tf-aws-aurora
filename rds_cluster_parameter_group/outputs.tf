output "aws_rds_cluster_parameter_group_id" {
  value = "${aws_rds_cluster_parameter_group.cluster_parameter_group.id}"
}

output "aws_rds_cluster_parameter_group_arn" {
  value = "${aws_rds_cluster_parameter_group.cluster_parameter_group.arn}"
}
