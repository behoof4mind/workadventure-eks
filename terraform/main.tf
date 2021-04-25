terraform {
  backend "s3" {}
}

module "webserver_cluster" {
  source                          = "github.com/behoof4mind/tf-module-workadventure?ref=0.0.1"
  eks_region                      = "us-east-2"
  eks_cluster_version             = "1.18"
  environment_name                = "dev"
  domain_name                     = "workadventure-game.link"
  worker_group_1_instance_type    = "t2.small"
  worker_group_2_instance_type    = "t2.medium"
  worker_group_1_desired_capacity = 2
  worker_group_2_desired_capacity = 1
}