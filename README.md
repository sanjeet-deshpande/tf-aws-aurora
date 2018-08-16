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

Blog
- Complete details are available on this blog - http://sanjeet-deshpande.blogspot.com/2018/05/terraform-modules-for-amazon-rds-aurora.html

Changelog

- [v0.0.1] 
   - Initial version:
     - Create RDS Aurora resources (DB Parameter Groups/Cluster Parameter Groups and DB Subnet groups)
     - Create Empty Aurora Cluster
     - Create Aurora cluster with data (Custom utility to restore data from s3 while creating aurora cluster)
     - Create Aurora cluster instances.
- [v0.0.2] 
   - Added support to create Aurora Cluster from snapshot (Cluster restoration from snapshot).
- [v0.0.3]
   - Added feature to choose old Aurora engine_version while creating Aurora instances. for example - Aurora cluster engine version - 5.6.10a and Instances belong this cluster are on - 5.6.10a.1.14.4 engine.
