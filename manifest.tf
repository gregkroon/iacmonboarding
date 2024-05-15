provider "harness" {
  api_key = var.HARNESS_API_KEY
  account_id = var.HARNESS_ACCOUNT_ID
}




resource "harness_platform_project" "example_project" {
  name        = "example_project"
  identifier  = "example_project_id"
  org_id      = "example_org_id"
  description = "Example project description"
}
