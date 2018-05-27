
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| comp_product_service | Enter product service | string | - | yes |
| comp_vars | Company Global variables | map | - | yes |
| apply_immediately | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. | string | `false` | no |
| aurora_cluster_name |  | string | - | yes |
| availability_zones | A comma separated list of Availability Zones in the Region. | list | `<list>` | no |
| aws_security_groups | List of VPC security groups to associate with the Cluster. | list | - | yes |
| backup_retention_period | The backup retention period | string | `30` | no |
| cluster_size | Number of cluster instances to create | string | - | yes |
| database_name | The name for your database of up to 8 alpha-numeric characters. | string | - | yes |
| db_cluster_parameter_group_name | A cluster parameter group to associate with the cluster. | string | - | yes |
| db_port | The port on which the DB accepts connections. | string | `3306` | no |
| db_subnet_group_name | A DB subnet group to associate with this DB instance. | string | - | yes |
| environment |  | string | - | yes |
| instance_class | Instance class to use when creating RDS cluster - db.t2.small/db.t2.medium/db.r3.large/db.r3.xlarge/db.r3.2xlarge/db.r3.4xlarge/db.r3.8xlarge | string | `db.t2.medium` | no |
| kms_key_id | The ARN for the KMS encryption key | string | - | yes |
| master_password | Password for the master DB user. | string | - | yes |
| master_username | Username for the master DB user. | string | - | yes |
| preferred_backup_window | The daily time range during which automated backups are created | string | `01:00-03:00` | no |
| publicly_accessible | Should the instance get a public IP address? | string | `false` | no |
| rds_cluster_engine | The name of the database engine to be used for this DB cluster. | string | `aurora` | no |
| rds_cluster_engine_version | The database engine version. | string | `5.6.10a` | no |
| role | Enter Role Name | string | - | yes |
| skip_final_snapshot | Determines whether a final DB snapshot is created before the DB cluster is deleted. | string | `false` | no |
| storage_encrypted | Specifies whether the DB cluster is encrypted. | string | `true` | no |
| vpc_id | VPC ID | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| allocated_storage |  |
| cluster_identifier |  |
| cluster_members |  |
| database_name |  |
| engine |  |
| engine_version |  |
| rds_cluster_id |  |
| reader_endpoint |  |
| replication_source_identifier |  |
| status |  |
| writer_endpoint |  |

