resource "aws_iam_role" "amplify_role" {
    name = "amplify_role_codecommit"

  assume_role_policy = <<POLICY
 {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "amplify.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
POLICY

}

resource "aws_iam_policy" "amplify_policy_codecommit" {
    name        = "amplify_policy"
  path        = "/"
  description = "amplify policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PushLogs",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],"Resource": "arn:aws:logs:us-east-2:517433031596:log-group:/aws/amplify/*:log-stream:*"
        },
        {
            "Sid": "CreateLogGroup",
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-east-2:517433031596:log-group:/aws/amplify/*"
        },
        {
            "Sid": "DescribeLogGroups",
            "Effect": "Allow",
            "Action": "logs:DescribeLogGroups",
            "Resource": "arn:aws:logs:us-east-2:517433031596:log-group:*"
        },
        {
            "Effect": "Allow",
            "Resource": [
                "arn:aws:codecommit:us-east-2:517433031596:serverless-webapp-repo"
            ],
            "Action": [
                "codecommit:GitPull"
            ]
        }
    ]
})

}

resource "aws_iam_role_policy_attachment" "amplify_role_policy_attachment" {
  policy_arn = aws_iam_policy.amplify_policy_codecommit.arn
  role = aws_iam_role.amplify_role.name
} 