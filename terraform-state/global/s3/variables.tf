variable "bucket_name" {
  description = "The name of the S3 bucket. Must be blobally unique."
  type        = string
  default     = "aws09-terraform-state"
}

variable "table_name" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "aws09-terraform-locks"
}
