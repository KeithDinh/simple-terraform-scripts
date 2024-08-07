terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.61.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["/Users/USER/.aws/conf"]
  shared_credentials_files = ["/Users/USER/.aws/creds"]
  profile                  = "awsProfile" # profile name that matches config and credentials
  region                   = "us-east-1" # Replace with your desired region
}

resource "aws_budgets_budget" "testing" {
  name              = "Monthly Cost Budget - exceed $4000"
  budget_type       = "COST"
  limit_amount      = "4000"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2024-08-07_00:01"
}

