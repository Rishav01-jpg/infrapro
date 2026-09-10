terraform {
  backend "s3" {
    bucket       = "infrapro-terraform-state-cec7d8a3af5a8df8c3c9d67700"
    key          = "infrapro/terraform.tfstate"
    region       = "us-east-2"
    use_lockfile = true
  }
}