variable "ami" {
  description = "The ID of the machine image (AMI) to use for the EC2 instances"
}

variable "instance_type" {
  description = "The type of instance to use for the EC2 instances"
  default     = "t2.micro"
}

variable "cluster_name" {
  description = "The name of the cluster"
}

variable "min_size" {
  description = "The minimum size of the ASG"
}

variable "max_size" {
  description = "The maximum size of the ASG"
}

variable "enable_autoscaling" {
  description = "Whether to enable autoscaling"
  type        = bool
  default     = false
}

variable "server_text" {
  description = "The text to display on the EC2 instances"
  default     = "Hello, World!"
}

variable "server_port" {
  description = "The port on which the server will listen"
  default     = 80
}

variable "custom_tags" {
  description = "Custom tags to add to resources"
  type        = map(string)
  default     = {}
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  type        = string
}
