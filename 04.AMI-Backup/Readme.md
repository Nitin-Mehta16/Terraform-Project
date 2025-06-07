# AMI Backup Terraform Project

## What the Project Does
This project automates the process of creating and managing Amazon Machine Image (AMI) backups using Terraform. It also provisions a robust AWS infrastructure for high availability, security, and automated deployment. Here’s what’s included:

- 🌐 VPC spanning 2 Availability Zones for high availability
- 🔗 4 Subnets — 1 public + 1 private per AZ
- 🏰 Bastion Host for secure access into private resources
- 💻 Private EC2 instances hosting static portfolio sites
- 🛣️ Route Tables (shared for public, dedicated for private)
- 🛡️ Network ACLs to tighten security across subnets
- ⚖️ Application Load Balancer spreading traffic smartly
- 🤖 Terraform Provisioners for automated deployment
- 📸 EBS Snapshots for reliable backups and recovery

## Why the Project is Useful
- **Automated Backups:** Reduces manual effort by automating AMI creation and retention.
- **Disaster Recovery:** Ensures you have up-to-date backups for quick recovery in case of failures.
- **Cost Management:** Helps manage backup retention to avoid unnecessary storage costs.
- **Infrastructure as Code:** Leverages Terraform for version-controlled, repeatable infrastructure deployment.

## How to Get Started
1. **Clone the Repository:**
   ```sh
   git clone <repository-url>
   cd 04.AMI-Backup
   ```
2. **Configure AWS Credentials:**
   Ensure your AWS credentials are set up locally (via environment variables or AWS CLI config).
3. **Customize Variables:**
   Edit `terraform.tfvars` and `variable.tf` to match your environment and backup requirements.
4. **Initialize Terraform:**
   ```sh
   terraform init
   ```
5. **Apply the Configuration:**
   ```sh
   terraform apply
   ```
6. **Verify Resources:**
   Check your AWS account for the created AMI backups and related resources.

## Where to Get Help
- **Documentation:** Refer to the official [Terraform documentation](https://www.terraform.io/docs/).
- **AWS Support:** For AWS-specific questions, visit the [AWS Support Center](https://aws.amazon.com/support/).


