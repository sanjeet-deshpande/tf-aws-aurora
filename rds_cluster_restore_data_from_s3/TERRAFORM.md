
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| apply_immediately | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. | string | `false` | no |
| aurora_cluster_identifier | Please provide Aurora Cluster identifier | string | - | yes |
| aurora_cluster_name |  | string | - | yes |
| aws_kms_key_id | The ARN for the KMS encryption key | string | - | yes |
| aws_rds_cluster_parameter_group_id | Enter Aurora Cluster parameter group id. | string | - | yes |
| aws_security_groups | List of VPC security groups to associate with the Cluster. | list | - | yes |
| backup_retention_period | The backup retention period | string | `30` | no |
| db_cluster_parameter_group_name | A cluster parameter group to associate with the cluster. | string | - | yes |
| db_port | The port on which the DB accepts connections. | string | `3306` | no |
| engine | Enter target Engine name. Defaults to aurora | string | `aurora` | no |
| environment |  | string | - | yes |
| master_password | Password for the master DB user. | string | - | yes |
| master_username | Username for the master DB user. | string | - | yes |
| preferred_backup_window | The daily time range during which automated backups are created | string | `01:00-03:00` | no |
| rds_db_subnet_group_id | Enter DB Subnet group id. | string | - | yes |
| restore_db_name | The name for your database of up to 8 alpha-numeric characters. | string | - | yes |
| s3_bucket_name | Enter backup S3 bucket name. | string | - | yes |
| s3_ingestion_role_arn | Enter S3 ingestion Role ARN. | string | - | yes |
| s3_prefix | Please provide S3 prefix | string | - | yes |
| security_group_id | Enter Aurora Security Group id. | string | - | yes |
| skip_final_snapshot | Determines whether a final DB snapshot is created before the DB cluster is deleted. | string | `false` | no |
| source_engine | (Optional) The name of the database engine to be used for this DB cluster. Defaults to mysql. | string | `mysql` | no |
| source_engine_version | (Optional) The database engine version. Defaults to 5.6.10a | string | `5.6.10a` | no |
| storage_encrypted | Specifies whether the DB cluster is encrypted. | string | `true` | no |

