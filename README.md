AWS Aurora MySQL Cluster Terraform module
===========

Terraform module for creating AWS Aurora MySQL Cluster

These types of resources are supported:
- `DB Option Group`
- `DB Parameter Group`
- `DB Subnet Group`
- `RDS Cluster - Without Data [Empty Cluster]`
- `RDS Cluster - With data, restore from S3`
- `RDS Cluster Instance`
- `RDS Cluster Parameter Group`

Root module calls these modules which can also be used separately to create independent resources:
* [DB Option Group](https://github.com/sanjeet-deshpande/tf-aws-aurora/tree/master/db_option_group) - Creates RDS DB Option Group
* [DB Parameter Group](https://github.com/sanjeet-deshpande/tf-aws-aurora/tree/master/db_parameter_group) - Creates RDS DB Parameter Group
* [DB Subnet Group](https://github.com/sanjeet-deshpande/tf-aws-aurora/tree/master/db_subnet_group) - Creates RDS DB Subnet Group
* [RDS Cluster](https://github.com/sanjeet-deshpande/tf-aws-aurora/tree/master/rds_cluster) - Creates RDS Cluster without data (Aurora)
* [RDS Cluster](https://github.com/sanjeet-deshpande/tf-aws-aurora/tree/master/rds_cluster_restore_data_from_s3) - Creates RDS Cluster with data, restore from S3 (Aurora)
* [RDS Cluster Instance](https://github.com/sanjeet-deshpande/tf-aws-aurora/tree/master/rds_cluster_instance) - Creates RDS Cluster Instances
* [RDS Cluster Parameter Group](https://github.com/sanjeet-deshpande/tf-aws-aurora/tree/master/rds_cluster_parameter_group) - Creates RDS Cluster Parameter Group

The input variables and output parameters are documented in
* [DB Option Group/TERRAFORM.md](https://github.com/sanjeet-deshpande/tf-aws-aurora/blob/master/db_option_group/TERRAFORM.md)
* [DB Parameter Group/TERRAFORM.md](https://github.com/sanjeet-deshpande/tf-aws-aurora/blob/master/db_parameter_group/TERRAFORM.md)
* [DB Subnet Group/TERRAFORM.md](https://github.com/sanjeet-deshpande/tf-aws-aurora/blob/master/db_subnet_group/TERRAFORM.md)
* [RDS Cluster/TERRAFORM.md](https://github.com/sanjeet-deshpande/tf-aws-aurora/blob/master/rds_cluster/TERRAFORM.md)
* [RDS Cluster Instance/TERRAFORM.md](https://github.com/sanjeet-deshpande/tf-aws-aurora/blob/master/rds_cluster_instance/TERRAFORM.md)
* [RDS Cluster Parameter Group/TERRAFORM.md](https://github.com/sanjeet-deshpande/tf-aws-aurora/blob/master/rds_cluster_parameter_group/TERRAFORM.md)
