# using Shared credentials file https://www.terraform.io/docs/providers/aws/index.html#shared-credentials-file
# using default location

variable "aws_profile" {
  type = "string"
}

provider "aws" {
  region                  = "us-west-2"
  profile                 = "${var.aws_profile}"
}


module "hello_fifo_queue" {
  source = "terraform-aws-modules/sqs/aws"

  name = "hello.fifo"

  fifo_queue = true
  content_based_deduplication = true

  tags = {
    Service     = "hello"
    Environment = "dev"
  }
}
