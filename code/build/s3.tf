provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "e7fed17f-705f-4400-92c4-e4cddc638fef"
    git_commit           = "83ab4017e8316e37747780f2007cac3f54c08dce"
    git_file             = "code/build/s3.tf"
    git_last_modified_at = "2024-09-11 16:48:16"
    git_last_modified_by = "sjweaver@us.ibm.com"
    git_modifiers        = "sjweaver"
    git_org              = "stevenjweaver"
    git_repo             = "prisma-cloud-devsecops-workshop"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
