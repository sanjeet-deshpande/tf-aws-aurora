
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| comp_product_service | Enter product service | string | - | yes |
| comp_vars | Company Global variables | map | - | yes |
| cluster_parameter_group_family | The family of the DB cluster parameter group. | string | `aurora5.6` | no |
| cluster_parameter_group_name | The name of the DB cluster parameter group. | string | - | yes |
| cluster_parameters | A list of cluster parameter maps to apply | list | `<list>` | no |
| environment |  | string | - | yes |
| role | Enter the role name | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| aws_rds_cluster_parameter_group_arn |  |
| aws_rds_cluster_parameter_group_id |  |

