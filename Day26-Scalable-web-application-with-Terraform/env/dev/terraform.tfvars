ami            = "ami-0fb653ca2d3203ac1"
instance_type  = "t2.micro"
cluster_name   = "dev-cluster"
min_size       = 1
max_size       = 3
enable_autoscaling = true
server_text    = "Welcome to the dev environment!"
server_port    = 8080
custom_tags    = {
  Environment = "dev"
  Project     = "terraform-demo"
}
db_remote_state_bucket = "terraform-bsm-my-state"
db_remote_state_key = "terraform.tfstate"