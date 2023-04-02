module "network" {
  
  source = "/home/dev97/Desktop/finalproject/terraform/network"

  our_region = var.region
  subnet_cidrs = var.subnet_cidrs
  vpc_cidrs = var.vpc_cidrs
  az = var.az


}

# module "aws_amplify" {
#   source = "/home/dev97/Desktop/finalproject/terraform/aws_amplify"
  
# }

module "eks" {
  source = "/home/dev97/Desktop/finalproject/terraform/eks"
  subnet_ids = [module.network.management_subnet,module.network.restricted_subnet]
}

# module "alb" {
#   source = "/home/dev97/Desktop/finalproject/terraform/alb"

#   env = "test"
#   group_name = "dev"
#   security_groups = module.network.security_groups
#   vpc_id = module.network.vpc_id
#   public_subnet = module.network.p_subnet_id
#   private_subnet = module.network.pv_subnet_id



# }




# module "asg" {
#     source = "/home/dev97/Desktop/finalproject/terraform/asg"
#     env = "test"
#     group_name = "prod"
#     target_group_arn = module.alb.target_group
#     vpc_id = module.network.vpc_id
#     public_subnet = module.network.p_subnet_id
#     private_subnet = module.network.pv_subnet_id
#     security_groups = module.network.security_groups


# }