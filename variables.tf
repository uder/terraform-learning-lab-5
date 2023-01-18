variable "aws_region" {
  description = "Default aws region"
  type        = string
  default     = "us-west-2"
}

variable "ec2_enabled" {
  description = "Enable EC2 Instance"
  type        = bool
  default     = true
}