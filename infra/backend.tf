terraform {
  backend "s3" {
    bucket         = "my-fleet-tf-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "my-fleet-tf-locks"
    encrypt        = true
  }
}
