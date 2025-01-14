variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}
variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-2"
}

variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
}