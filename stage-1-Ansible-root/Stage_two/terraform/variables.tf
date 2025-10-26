variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}

variable "instance_ami" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-0cd59ecaf368e5ccf" # Amazon Linux 2 example
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
