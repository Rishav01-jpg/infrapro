terraform {
  backend "s3" {
    bucket       = "infrapro-terraform-state-fa54fd3dd6771f0875a5207a83"
    key          = "infrapro/terraform.tfstate"
    region       = "us-east-2"
    use_lockfile = true
  }
}