variable "aws_region" {
  type        = string
  default     = "us-east-1" 
}

variable "ami_id" {
  type        = string
  default     = "ami-0866a3c8686eaeeba" #  Ubuntu AMI
}

variable "instance_type" {
  type        = string
  default     = "t2.micro" 
}

variable "subnet_id" {
  type        = string
}

variable "security_group_id" {
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}