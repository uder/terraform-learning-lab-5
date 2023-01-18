variable "aws_region" {
  description = "AWS Region. Should be passed from upper module"
  type        = string
}

variable "default_tags" {
  description = "EC2 default tags"
  type        = map(string)
  default = {
    Environment = "test"
    Learning    = "true"
  }
}

variable "ec2_enabled" {
  description = "Enable EC2 Instance"
  type        = bool
}
