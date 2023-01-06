resource "aws_amplify_app" "amplify_app" {
  name       = "serverless-webapp"
  # repository = aws_codecommit_repository.test.clone_url_http
    repository =  "https://github.com/matriix00/simple-web-amplify"
  # The default build_spec added by the Amplify Console for React.
  build_spec = <<-EOT
    version: 1
    frontend:
      phases:
        build:
          commands: []
      artifacts:
        baseDirectory: /
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT


  
  enable_branch_auto_build = true
  access_token = "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"
    

}





resource "aws_amplify_branch" "amplify_branch" {
  app_id      = aws_amplify_app.amplify_app.id
  branch_name = "master"

  framework = "Web"
  stage     = "PRODUCTION"


}





