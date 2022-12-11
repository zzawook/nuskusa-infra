terraform {
    backend "s3" {
        bucket = "nuskusa-tfbackend-s3"
        key = "prod/storage/terraform.tfstate"
        region = "ap-southeast-1"
        max_retries = 3
    }
}
