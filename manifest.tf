provider "harness" {
  api_key = var.HARNESS_API_KEY
  account_id = var.HARNESS_ACCOUNT_ID
}



resource "harness_platform_project" "project" {
  name        = var.HARNESS_PROJECT_ID
  identifier  = var.HARNESS_PROJECT_ID
  org_id      = var.HARNESS_ORG_ID
  description = "Example project description"
}
