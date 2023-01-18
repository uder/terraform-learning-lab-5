resource "aws_s3_bucket" "psalnikov-learning-terraform-s3" {
  lifecycle {
    prevent_destroy = true
  }
}
