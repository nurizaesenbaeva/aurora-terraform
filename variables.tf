variable "cluster_identifier" {
  default = "aurora-cluster-demo"
}

variable "engine_version" {
  default = "5.7.mysql_aurora.2.04.2"
}

variable "availability_zones" {
  type = list(string)
  default = ["us-east-1a","us-east-1b", "us-east-1c"]
}


variable "instance_class" {
  default = "db.t3.small"
}

variable "instance_number" {
  default = 3
}

variable "db_creds" {
  type = "map"
  default = {
    "master_username" = "root"
    "master_password" = "SUPERSEKRITPASSWORD"
  }
}

variable "backup_retention_period" {
  default = 5
}

variable "preferred_backup_window" {
  default = "07:00-09:00"
}