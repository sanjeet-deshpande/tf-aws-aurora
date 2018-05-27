AWS RDS CLUSTER
===========

Terraform code for creating RDS Cluster (Aurora) with data - By restoring data from S3.

----------------------
This one is not a Terraform module. By default terraform doesn't support data restore from s3 while launching Aurora Cluster. Already submitted feature request with Terraform [Issue link](https://github.com/terraform-providers/terraform-provider-aws/issues/2410)

To temporary overcome this terraform limitation, we have written simple python tool which will launch Aurora cluster with data by restoring data from S3.
As such there is no module for this, as we are just going to invoke python with the help of terraform. to run this successfully, python tool needs some parameters.
As per the Usage section you have to use this as it is.

```Restore From S3```
* RDS Aurora supports creating cluster by restoring the data from S3, which is having actual MySQL backup.
* We should be using percona XtraDB backup tool to take of backup of EC2 MySQL database.
* Once backup is ready please upload it to AWS S3 bucket and pass the same while creating the Aurora cluster.
* This particular code expects 2 things here:
** S3 bucket Name
** S3 prefix for the backup
** For example: S3 bucket name is ue1ppfdev-mysql-backup and prefix is '20180125'. the actual backup file is going to available on s3 with this path - https://s3.console.aws.amazon.com/s3/buckets/ue1ppfdev-mysql-backup/20180125/backup.tar.gz/?region=us-east-1&tab=overview


Usage
-----

```

resource "null_resource" "main" {
  provisioner "local-exec" {
    command = "python aurora_cluster.py --cluster_identifier ${var.aurora_cluster_identifier} --db_cluster_parameter_group_name ${data.terraform_remote_state.aurora_resources.aws_rds_cluster_parameter_group_id}  --db_subnet_group_name  ${data.terraform_remote_state.aurora_resources.rds_db_subnet_group_id} --vpc_security_groups_ids ${data.terraform_remote_state.security_group.security_group_id} --source_engine ${var.source_engine} --source_engine_version ${var.source_engine_version} --aurora_engine ${var.engine} --master_username ${var.master_username} --master_password  ${var.master_password} --s3_bkp_bucket_name ${var.s3_bucket_name} --s3_bucket_prefix ${var.s3_prefix} --s3_ingestion_role_name ${var.s3_ingestion_role_arn} --restore_db_name ${var.restore_db_name} --storage_encrypted ${var.storage_encrypted} --kms_key_id ${data.terraform_remote_state.aurora_resources.aws_kms_key_id}"
  }
}

```
