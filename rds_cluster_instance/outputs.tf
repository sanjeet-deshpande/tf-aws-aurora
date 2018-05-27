output "instance_identifier" {
  value = "${aws_rds_cluster_instance.cluster_instance.identifier}"
}

output "instance_id" {
  value = "${aws_rds_cluster_instance.cluster_instance.id}"
}

output "is_instance_write" {
  value = "${aws_rds_cluster_instance.cluster_instance.writer}"
}

output "instance_availability_zone" {
  value = "${aws_rds_cluster_instance.cluster_instance.availability_zone}"
}

output "dbi_resource_id" {
  value = "${aws_rds_cluster_instance.cluster_instance.dbi_resource_id}"
}
