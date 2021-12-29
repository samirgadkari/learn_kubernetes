provider "aws" {
  region = "us-west-2"      # Use us-west-2 region for aws provider
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "a123-test-bucket"
  acl = "private"           # We will not allow public access to this bucket
}

# terraform init      # initialize terraform
# terraform plan      # shows what it will provision. + will be added, - will be removed,
#		      # ~ will be modified in place.
# terraform apply     # will proppse changes, and will give you a chance to accept them,
#  		      # before provisioning those changes.
# terraform destroy   # Remove all resources allocated from files in this directory.
