variable "vpc_cidr"{
 description="CIDR block for the vpc"
 type = string
}

variable "public_subnets"{
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnets"{
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "azs"{
  description = "List of availability zones to use"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}