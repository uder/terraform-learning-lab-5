provider "aws" {
  region = var.aws_region
}

module "s3" {
  source = "./modules/s3"
}

module "ec2" {
  source      = "./modules/ec2"
  aws_region  = var.aws_region
  ec2_enabled = var.ec2_enabled
}
