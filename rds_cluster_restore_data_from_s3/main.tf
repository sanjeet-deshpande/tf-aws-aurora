resource "null_resource" "main" {
  provisioner "local-exec" {
    command = "python aurora_cluster.py --cluster_identifier ${var.aurora_cluster_identifier} --db_cluster_parameter_group_name ${var.aws_rds_cluster_parameter_group_id}  --db_subnet_group_name  ${var.rds_db_subnet_group_id} --vpc_security_groups_ids ${var.security_group_id} --source_engine ${var.source_engine} --source_engine_version ${var.source_engine_version} --aurora_engine ${var.engine} --master_username ${var.master_username} --master_password  ${var.master_password} --s3_bkp_bucket_name ${var.s3_bucket_name} --s3_bucket_prefix ${var.s3_prefix} --s3_ingestion_role_name ${var.s3_ingestion_role_arn} --restore_db_name ${var.restore_db_name} --storage_encrypted ${var.storage_encrypted} --kms_key_id ${var.aws_kms_key_id}"
  }
}
