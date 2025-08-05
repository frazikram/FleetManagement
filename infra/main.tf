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
