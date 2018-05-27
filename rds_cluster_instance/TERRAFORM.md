
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| apply_immediately | Specifies whether any database modifications are applied immediately, or during the next maintenance window. | string | `false` | no |
| auto_minor_version_upgrade | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. | string | `true` | no |
| cluster_identifier | The identifier of the aws_rds_cluster in which to launch this instance. | string | - | yes |
| cluster_size | Number of cluster instances to create | string | `2` | no |
| comp_product_service | Enter product service | string | - | yes |
| comp_vars | Company Global variables | map | - | yes |
| db_parameter_group_name | The name of the DB parameter group to associate with this instance. | string | - | yes |
| environment |  | string | - | yes |
| instance_class | Instance class to use when creating RDS cluster - db.t2.small/db.t2.medium/db.r3.large/db.r3.xlarge/db.r3.2xlarge/db.r3.4xlarge/db.r3.8xlarge | string | `db.t2.medium` | no |
| instance_identifier | Instance identifier to identify instances. | string | - | yes |
| promotion_tier | Default 0. Failover Priority setting on instance level. | string | `0` | no |
| publicly_accessible | Should the instance get a public IP address? | string | `false` | no |
| role | Enter Role Name | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| dbi_resource_id |  |
| instance_availability_zone |  |
| instance_id |  |
| instance_identifier |  |
| is_instance_write |  |

