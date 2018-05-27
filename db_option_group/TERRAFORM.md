
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| comp_product_service | Enter product service | string | - | yes |
| comp_vars | Company Global variables | map | - | yes |
| db_engine_name | DB Engine Name | string | `aurora` | no |
| db_engine_version | DB Engine version | string | `5.6` | no |
| db_option_group_name | Aurora DB Option Group Name | string | - | yes |
| environment | environment name whether its staging or prod for tagging. | string | - | yes |
| role | Enter the role name | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| rds_db_option_group_arn |  |
| rds_db_option_group_id |  |

