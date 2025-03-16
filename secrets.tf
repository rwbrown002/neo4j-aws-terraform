data "aws_secretsmanager_random_password" "password_gen" {
  password_length = 16
}

resource "aws_secretsmanager_secret" "password_gen" {
  name = "neo4j-creds"
}

resource "aws_secretsmanager_secret_version" "password_gen" {
  secret_id     = aws_secretsmanager_secret.password_gen.id
  secret_string = data.aws_secretsmanager_random_password.password_gen
}
