provider "aws" {
  region = "us-east-2"
}

# Appel du module EC2
# module "ec2" {
#   source          = "../../modules/ec2"
#   ami             = var.ami
#   instance_type   = var.instance_type
#   server_port     = var.server_port
#   server_text     = var.server_text
#    vpc_id = data.aws_vpc.default.id
# }


module "asg" {
  source         = "../../modules/asg"
 
  cluster_name   = var.cluster_name
  min_size       = var.min_size
  max_size       = var.max_size
  enable_autoscaling = var.enable_autoscaling
  custom_tags    = var.custom_tags
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key = var.db_remote_state_key
  aws_launch_configuration_name = module.ec2.aws_launch_configuration_name

}

module "ec2" {
  source          = "../../modules/ec2"
  ami            = var.ami
  instance_type  = var.instance_type
  cluster_name   = var.cluster_name


}



module "elb" {
  source          = "../../modules/elb"
  cluster_name    = var.cluster_name
  server_port     = var.server_port

}

