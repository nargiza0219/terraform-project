module "vpc" {
  source = "./VPC"
}

module "security_group" {
  source = "./security_groups"
  vpc_id = module.vpc.main_vpc
}

module "ec2" {
  source           = "./EC2"
  public_subnet_id = module.vpc.public_subnet
  security_groups = [module.security_group.security_groups]
  vpc_id = module.vpc.main_vpc
}

module "template" {
  source = "./Template"
  key_pair = module.ec2.key_pair
  private_subnet_id = module.vpc.private_subnet
  security_groups = [module.security_group.security_groups]
  vpc_id = module.vpc.main_vpc
}

module "main_asg" {
  source = "./Asg"
  # main_template = module.templ
  main_template = module.template.main_template
}

module "elb" {
  source = "./Alb"
  autoscaling_group_name = module.main_asg.main_asg
  public_subnet = module.vpc.public_subnet
   public_subnet2 = module.vpc.public_subnet
  security_groups = module.security_group.security_groups
  vpc_id = module.vpc.main_vpc
  
}