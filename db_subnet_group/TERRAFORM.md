
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| comp_product_service | Enter product service | string | - | yes |
| comp_vars | Company Global variables | map | - | yes |
| db_subnet_group_name | The name of the DB subnet group. | string | - | yes |
| environment | environment name whether its staging or prod for tagging. | string | - | yes |
| role | Enter the role name | string | - | yes |
| subnets | A comma separated list of Subnets to use in creating RDS subnet group (must already exist) | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| rds_db_subnet_group_arn |  |
| rds_db_subnet_group_id |  |

