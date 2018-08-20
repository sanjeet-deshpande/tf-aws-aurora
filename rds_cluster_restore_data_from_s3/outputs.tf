output "rds_cluster_id" {
  value = "${aws_rds_cluster.aurora.id}"
}

output "writer_endpoint" {
  value = "${aws_rds_cluster.aurora.endpoint}"
}

output "reader_endpoint" {
  value = "${aws_rds_cluster.aurora.reader_endpoint}"
}

output "cluster_identifier" {
  value = "${aws_rds_cluster.aurora.cluster_identifier}"
}

output "cluster_members" {
  value = "${aws_rds_cluster.aurora.cluster_members}"
}

output "engine" {
  value = "${aws_rds_cluster.aurora.engine}"
}

output "engine_version" {
  value = "${aws_rds_cluster.aurora.engine_version}"
}

output "database_name" {
  value = "${aws_rds_cluster.aurora.database_name}"
}
