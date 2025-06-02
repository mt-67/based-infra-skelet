resource "aws_iam_role" "irsa" {
  name = "irsa"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow"
      Principal = {
        Federated = aws_iam_openid_connect_provider.eks.arn
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub" = "system:serviceaccount:default:logs-writer"
        }
      }
    }]
  })
}

resource "aws_iam_policy" "logs_writer" {
  name        = "logs-writer"
  description = "Allow writing to CloudWatch Logs"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow"
      Action = [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
      Resource = "*"
    }]
  })
}

resource "aws_iam_role" "flow_logs_role" {
  name = "vpc-flow-logs-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "vpc-flow-logs.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "flow_logs_policy" {
  name = "vpc-flow-logs-policy"
  role = aws_iam_role.flow_logs_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      Resource = "*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "logs_writer_attach" {
  role       = aws_iam_role.irsa.name
  policy_arn = aws_iam_policy.logs_writer.arn
}

resource "kubernetes_service_account" "logs_writer" {
  metadata {
    name      = "logs-writer"
    namespace = "default"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.irsa.arn
    }
  }


resource "aws_iam_role_policy" "s3_policy" {
  name = "check_s3_object_policy"
  role = aws_iam_role.s3_object.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "s3:GetObject"
      ],
      Resource = "bucket1"
    }]
  })
}

  # TODO: Attach this SA to a pod via spec.serviceAccountName: logs-writer
}
