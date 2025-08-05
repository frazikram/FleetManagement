module "vpc"{
  source ="./modules/vpc"
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}
module "apigateway" {
  source           = "./modules/apigateway"
  apigw_stage_name = var.apigw_stage_name
}
module "dynamodb" {
  source = "./modules/dynamodb"
}

module "sns" {
  source = "./modules/sns"
}
//Come back to this to redeploy db
# module "rds" {
#   source         = "./modules/rds"
#   db_name        = var.db_name
#   db_user        = var.db_user
#   db_password    = var.db_password
#   vpc_id         = module.vpc.vpc_id
#   subnet_ids     = module.vpc.private_subnet_ids
#   rds_sg_id      = module.vpc.rds_sg_id
# }
