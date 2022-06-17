
resource "aws_rds_cluster" "default" {
  cluster_identifier = var.cluster_identifier
  engine = "aurora-mysql"
  engine_version = var.engine_version
  availability_zones = var.availability_zones
  database_name = var.cluster_identifier
  master_username = var.db_creds["master_username"]
  master_password = var.db_creds["master_password"]
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
}

resource "aws_rds_cluster_instance" "aurora_cluster_instance" {
  count = var.instance_number
  engine = "aurora-mysql"
  engine_version = var.engine_version
  identifier = "${var.cluster_identifier}-${count.index}"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class = var.instance_class
  publicly_accessible = false    ##think about making it variable

  lifecycle {
    create_before_destroy = true
  }
}