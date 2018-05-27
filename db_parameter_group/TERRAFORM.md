
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| comp_product_service | Enter product service | string | - | yes |
| comp_vars | Company Global variables | map | - | yes |
| db_parameter_family | The family of the DB parameter group. | string | `aurora5.6` | no |
| db_parameter_group_name | DB Parameter Group Name | string | - | yes |
| db_parameters | A list of db parameter maps to apply | list | `<list>` | no |
| environment | environment name whether its staging or prod for tagging. | string | - | yes |
| role | Enter the role name | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| rds_db_parameter_group_arn |  |
| rds_db_parameter_group_id |  |

