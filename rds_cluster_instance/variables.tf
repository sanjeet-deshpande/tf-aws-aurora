variable "environment" {}

variable "comp_vars" {
  type        = "map"
  description = "Company Global variables"
}

variable "role" {
  description = "Enter Role Name"
}

variable "comp_product_service" {
  description = "Enter product service"
}

variable "cluster_identifier" {
  description = "The identifier of the aws_rds_cluster in which to launch this instance."
}

variable "instance_class" {
  description = "Instance class to use when creating RDS cluster - db.t2.small/db.t2.medium/db.r3.large/db.r3.xlarge/db.r3.2xlarge/db.r3.4xlarge/db.r3.8xlarge"
  default     = "db.t2.medium"
}

variable "publicly_accessible" {
  description = "Should the instance get a public IP address?"
  default     = false
}

#variable "db_subnet_group_name" {
#description = "A DB subnet group to associate with this DB instance."
#}

variable "db_parameter_group_name" {
  description = "The name of the DB parameter group to associate with this instance."
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window."
  default     = false
}

#variable "monitoring_role_arn" {
#  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs."
#}

#variable "monitoring_interval" {
#description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance"
#default     = "10"
#}

variable "cluster_size" {
  description = "Number of cluster instances to create"
  default     = "2"
}

variable "instance_identifier" {
  description = "Instance identifier to identify instances."
}

variable "promotion_tier" {
  description = "Default 0. Failover Priority setting on instance level."
  default     = "0"
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
  default     = true
}

variable "engine_version" {
  description = "(Optional) The database engine version."
  default     = "5.6.10a"
}
