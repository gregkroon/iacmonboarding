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

resource "harness_platform_workspace" "workspace" {
  name        = "example_workspace"
  identifier  = "example_workspace_id"
  org_id      = var.HARNESS_ORG_ID
  project_id  = var.HARNESS_PROJECT_ID
  description = "Example workspace description"
}
