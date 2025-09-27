terraform {
  required_providers {
    snowflake = {
        source = "snowflakedb/snowflake"
        version = "~> 1.0.5"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "snowflake" {
  organization_name = var.snowflake_org_name
  account_name = var.snowflake_account_name
  user = var.snowflake_user
  password = var.snowflake_password
  role     = var.snowflake_role
  
  preview_features_enabled = ["snowflake_current_account_datasource", "snowflake_storage_integration_resource", "snowflake_stage_resource", "snowflake_table_resource"]

}

provider "aws" {
  region = "us-east-1" # You can change this to your preferred AWS region
}

