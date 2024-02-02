module "vpc" {
  source = "./VPC"
}

module "ec2" {
  source           = "./EC2"

  
  subnet_id = module.vpc.public_subnet1
}
