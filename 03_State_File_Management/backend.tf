terraform {
  backend "s3" {
    bucket = "tf-bucket-for-state-file"
    key    = "tf-backend/state-file"
    region = "us-east-1"
    
    dynamodb_table = "tf-dt"
    encrypt = true
  }
}