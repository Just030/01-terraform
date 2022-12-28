provider "local" {
  region = "ap-northeast-2"
}

variable "user_names" {
  description = "Creat IAM users with these names"
  type        = list(string)
  default = ["aws09-neo", "aws09-trinity", "aws09-morpheus"]
}

output "for_directive" {
  value = <<~EOF
		%{for name in var.user_names }
			${name}
		%{endfor }
		EOF
}
