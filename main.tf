module "aws_vpc" {
  source          = "github.com/bismarkcastilla/aws-vpc.git"
  networking      = var.networking
  security_groups = var.security_groups
}

