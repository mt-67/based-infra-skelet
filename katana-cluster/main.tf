resource "aws_cloudwatch_log_group" "vpc_logs" {
  name              = "/vpc/flow-logs"
  retention_in_days = 30

  tags = {
    Name = "VPC Flow Logs"
  }
}
