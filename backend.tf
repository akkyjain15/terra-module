terraform {
    backend "s3" {
        bucket = "ninja19-terraform-s3-bucket-lock"
        key    = "ninja19/terraform.tfstate"
        region     = "us-east-1"
        dynamodb_table = "dynamodb-state-locking"
    }
}
