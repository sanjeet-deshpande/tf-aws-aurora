variable "environment" {}

variable "aurora_cluster_name" {}

variable "aws_security_groups" {
  description = "List of VPC security groups to associate with the Cluster."
  type        = "list"
}

variable "aurora_cluster_identifier" {
   description = "Please provide Aurora Cluster identifier"
}

variable "source_engine" {
  description = "(Optional) The name of the database engine to be used for this DB cluster. Defaults to mysql."
  default = "mysql"
}

variable "source_engine_version" {
  description = "(Optional) The database engine version. Defaults to 5.6.10a"
  default     = "5.6.10a"
}

variable "s3_prefix" {
   description = "Please provide S3 prefix"
}

variable "db_port" {
  description = "The port on which the DB accepts connections."
  default     = 3306
}

# see aws_rds_cluster documentation for these variables
variable "restore_db_name" {
  description = "The name for your database of up to 8 alpha-numeric characters."
}

variable "master_username" {
  description = "Username for the master DB user."
}

variable "master_password" {
  description = "Password for the master DB user."
}

variable "backup_retention_period" {
  description = "The backup retention period"
  default     = "30"
}

variable "preferred_backup_window" {
  description = "The daily time range during which automated backups are created"
  default     = "01:00-03:00"
}

variable "storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted."
  default     = true
}

variable "apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window."
  default     = false
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted."
  default     = false
}

variable "db_cluster_parameter_group_name" {
  description = "A cluster parameter group to associate with the cluster."
}

variable "aws_kms_key_id" {
  description = "The ARN for the KMS encryption key"
}

variable "aws_rds_cluster_parameter_group_id" {
  description = "Enter Aurora Cluster parameter group id."
}

variable "rds_db_subnet_group_id" {
   description = "Enter DB Subnet group id."
}

variable "security_group_id" {
   description = "Enter Aurora Security Group id."
}

variable "engine" {
   description = "Enter target Engine name. Defaults to aurora"
   default = "aurora"
}

variable "s3_bucket_name" {
  description = "Enter backup S3 bucket name."
}

variable "s3_ingestion_role_arn" {
   description = "Enter S3 ingestion Role ARN."
}
