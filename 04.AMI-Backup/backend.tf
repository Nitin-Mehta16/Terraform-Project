# terraform {
#   backend "s3" {
#     bucket         = "my-terraform-state-bucket"    # Replace with your S3 bucket name
#     key            = "env/dev/terraform.tfstate"    # Organize state files by env/project
#     region         = "us-east-1"                    # Same region as your resources
#     encrypt        = true
#     dynamodb_table = "terraform-locks"              # Optional but recommended for state locking
#   }
# }