resource "aws_flow_log" "vpc" {
  log_destination      = aws_cloudwatch_log_group.vpc_logs.arn
  traffic_type         = "ALL"
  vpc_id               = module.vpc.vpc_id
  log_format           = "${timestamp} ${srcaddr} ${dstaddr}"
}
