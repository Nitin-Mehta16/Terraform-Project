
provider "aws" {
  region = "us-east-1"
  
}


resource "aws_instance" "server" {
  ami          =  "ami-0a1b648e2cd533174"
  instance_type = "t2.micro"

  tags = {
    name = "terraform_server" 
  }
}

resource "aws_s3_bucket" "tf-bucket" {
  bucket = "tf-bucket-for-state-file"
  force_destroy = true //allow bucket to be destroyed when destroyed command applied

}

resource "aws_s3_bucket_versioning" "tf-bucket-versioning" {
  bucket = aws_s3_bucket.tf-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.tf-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
    }
  }
}


resource "aws_s3_bucket_public_access_block" "public-access" {
  bucket = aws_s3_bucket.tf-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "tf-lock" {
  name             = "tf-dt"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}

