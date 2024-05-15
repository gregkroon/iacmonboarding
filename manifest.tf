terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
}

provider "harness" {
  platform_api_key = var.HARNESS_API_KEY
  account_id = var.HARNESS_ACCOUNT_ID
  endpoint = "https://app.harness.io/gateway"
}

resource "harness_platform_project" "project" {
  name = var.HARNESS_PROJECT_ID
  identifier  = var.HARNESS_PROJECT_ID
  org_id      = var.HARNESS_ORG_ID
  description = "Example project description"
}

resource "harness_platform_connector_aws" "aws_connector" {
  identifier = var.HARNESS_AWS_CONNECTOR_ID

  aws_manual {
    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
  }
}








resource "harness_platform_workspace" "workspace" {
  name        = var.HARNESS_WORKSPACE_ID
  identifier  = var.HARNESS_WORKSPACE_ID
  org_id      = var.HARNESS_ORG_ID
  project_id  = var.HARNESS_PROJECT_ID
  description = "Example workspace description"


  cost_estimation_enabled = var.HARNESS_COST_ESTIMATION_ENABLED
  provisioner_version = var.HARNESS_PROVISIONER_VERSION
  repository_path = var.HARNESS_REPO_PATH
  repository = var.HARNESS_REPO
  provider_connector = var.HARNESS_PROVIDER_CONNECTOR
  provisioner_type = var.HARNESS_PROVISONER_TYPE
  repository_connector = var.HARNESS_REPO_CONNECTOR

}
