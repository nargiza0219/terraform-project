module "vpc" {
  source = "./VPC"
}

module "security_group" {
  source = "./security_groups"
  vpc_id = module.vpc.main_vpc
}

module "ec2" {
  source           = "./EC2"
  subnet_id = module.vpc.public_subnet
  security_groups = [module.security_group.security_groups]
  vpc_id = module.vpc.main_vpc
}


