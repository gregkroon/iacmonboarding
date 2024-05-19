# Onboarding Pipeline
This repository contains the configuration for the Harness Onboarding Pipeline. This pipeline provisions new projects within Harness, including setting up workspaces and necessary resources using Terraform.

## 1. Create the onboarding template in harness using this pipeline 
Before running the pipeline, ensure you have the following:

```
pipeline:
  name: Onboarding Pipeline
  identifier: Onboarding_Pipeline
  projectIdentifier: onboarding
  orgIdentifier: default
  tags: {}
  stages:
    - stage:
        name: onboarding
        identifier: onboarding
        description: ""
        type: IACM
        spec:
          platform:
            os: Linux
            arch: Amd64
          runtime:
            type: Cloud
            spec: {}
          workspace: onboarding
          execution:
            steps:
              - step:
                  type: Run
                  name: Terraform Plan
                  identifier: Run_Onboarding
                  spec:
                    connectorRef: account.harnessImage
                    image: hashicorp/terraform:1.5.6
                    shell: Sh
                    command: |-
                      terraform init

                      terraform plan  \
                        -var="HARNESS_API_KEY=<+pipeline.variables.HARNESS_API_KEY>" \
                        -var="HARNESS_ACCOUNT_ID=<+pipeline.variables.HARNESS_ACCOUNT_ID>" \
                        -var="HARNESS_ORG_ID=<+pipeline.variables.HARNESS_ORG_ID>" \
                        -var="HARNESS_AWS_CONNECTOR_ID=<+pipeline.variables.HARNESS_AWS_CONNECTOR_ID>" \
                        -var="AWS_ACCESS_KEY=<+pipeline.variables.AWS_ACCESS_KEY>" \
                        -var="AWS_SECRET_KEY=<+pipeline.variables.AWS_SECRET_KEY>" \
                        -var="HARNESS_GITHUB_CONNECTOR_ID=<+pipeline.variables.HARNESS_GITHUB_CONNECTOR_ID>" \
                        -var="HARNESS_GITHUB_URL=<+pipeline.variables.HARNESS_GITHUB_URL>" \
                        -var="GITHUB_USER=<+pipeline.variables.GITHUB_USER>" \
                        -var="HARNESS_COST_ESTIMATION_ENABLED=<+pipeline.variables.HARNESS_COST_ESTIMATION_ENABLED>" \
                        -var="HARNESS_REPO_PATH=<+pipeline.variables.HARNESS_REPO_PATH>" \
                        -var="HARNESS_REPO_BRANCH=<+pipeline.variables.HARNESS_REPO_BRANCH>" \
                        -var="HARNESS_GITHUB_SECRET_VALUE=<+pipeline.variables.HARNESS_GITHUB_SECRET_VALUE>" \
                        -var="HARNESS_PROJECT_ID=<+pipeline.variables.HARNESS_PROJECT_ID>" \
                        -var="HARNESS_PROVISIONER_VERSION=<+pipeline.variables.HARNESS_PROVISIONER_VERSION>" \
                        -var="HARNESS_REPO=<+pipeline.variables.HARNESS_REPO>" \
                        -var="HARNESS_WORKSPACE_ID=<+pipeline.variables.HARNESS_WORKSPACE_ID>"
              - step:
                  type: Run
                  name: Terraform Apply
                  identifier: Terraform_Apply
                  spec:
                    connectorRef: account.harnessImage
                    image: hashicorp/terraform:1.5.6
                    shell: Sh
                    command: |-
                      terraform init

                        terraform apply -auto-approve  \
                        -var="HARNESS_API_KEY=<+pipeline.variables.HARNESS_API_KEY>" \
                        -var="HARNESS_ACCOUNT_ID=<+pipeline.variables.HARNESS_ACCOUNT_ID>" \
                        -var="HARNESS_ORG_ID=<+pipeline.variables.HARNESS_ORG_ID>" \
                        -var="HARNESS_AWS_CONNECTOR_ID=<+pipeline.variables.HARNESS_AWS_CONNECTOR_ID>" \
                        -var="AWS_ACCESS_KEY=<+pipeline.variables.AWS_ACCESS_KEY>" \
                        -var="AWS_SECRET_KEY=<+pipeline.variables.AWS_SECRET_KEY>" \
                        -var="HARNESS_GITHUB_CONNECTOR_ID=<+pipeline.variables.HARNESS_GITHUB_CONNECTOR_ID>" \
                        -var="HARNESS_GITHUB_URL=<+pipeline.variables.HARNESS_GITHUB_URL>" \
                        -var="GITHUB_USER=<+pipeline.variables.GITHUB_USER>" \
                        -var="HARNESS_COST_ESTIMATION_ENABLED=<+pipeline.variables.HARNESS_COST_ESTIMATION_ENABLED>" \
                        -var="HARNESS_REPO_PATH=<+pipeline.variables.HARNESS_REPO_PATH>" \
                        -var="HARNESS_REPO_BRANCH=<+pipeline.variables.HARNESS_REPO_BRANCH>" \
                        -var="HARNESS_GITHUB_SECRET_VALUE=<+pipeline.variables.HARNESS_GITHUB_SECRET_VALUE>" \
                        -var="HARNESS_PROJECT_ID=<+pipeline.variables.HARNESS_PROJECT_ID>" \
                        -var="HARNESS_PROVISIONER_VERSION=<+pipeline.variables.HARNESS_PROVISIONER_VERSION>" \
                        -var="HARNESS_REPO=<+pipeline.variables.HARNESS_REPO>" \
                        -var="HARNESS_WORKSPACE_ID=<+pipeline.variables.HARNESS_WORKSPACE_ID>"
        tags: {}
  variables:
    - name: HARNESS_API_KEY
      type: String
      description: ""
      required: false
      value: "pat.Ke-E1FX2SO2ZAL2TXqpLjg.664537d4942d05052c000e83.8axd26wRxrpKDeid21AL "
    - name: HARNESS_ACCOUNT_ID
      type: String
      description: ""
      required: false
      value: Ke-E1FX2SO2ZAL2TXqpLjg
    - name: HARNESS_ORG_ID
      type: String
      description: ""
      required: true
      value: <+input>
    - name: HARNESS_AWS_CONNECTOR_ID
      type: String
      description: ""
      required: true
      value: aws
    - name: AWS_ACCESS_KEY
      type: String
      description: ""
      required: true
      value: <+secrets.getValue("tenantawsaccesskey")>
    - name: AWS_SECRET_KEY
      type: String
      description: ""
      required: true
      value: <+secrets.getValue("tenantawssecretkey")>
    - name: HARNESS_GITHUB_CONNECTOR_ID
      type: String
      description: ""
      required: false
      value: github
    - name: HARNESS_GITHUB_URL
      type: String
      description: ""
      required: true
      value: <+input>
    - name: GITHUB_USER
      type: String
      description: ""
      required: true
      value: <+secrets.getValue("tenantgithubuser")>
    - name: HARNESS_COST_ESTIMATION_ENABLED
      type: String
      description: ""
      required: true
      value: <+input>
    - name: HARNESS_REPO_PATH
      type: String
      description: ""
      required: true
      value: <+input>
    - name: HARNESS_REPO_BRANCH
      type: String
      description: ""
      required: true
      value: <+input>
    - name: HARNESS_GITHUB_SECRET_VALUE
      type: String
      description: ""
      required: true
      value: <+secrets.getValue("tenantgithubsecret")>
    - name: HARNESS_PROJECT_ID
      type: String
      description: ""
      required: true
      value: <+input>
    - name: HARNESS_PROVISIONER_VERSION
      type: String
      description: ""
      required: true
      value: <+input>
    - name: HARNESS_PROVISONER_TYPE
      type: String
      description: ""
      required: true
      value: <+input>
    - name: HARNESS_REPO
      type: String
      description: ""
      required: true
      value: <+input>
    - name: HARNESS_WORKSPACE_ID
      type: String
      description: ""
      required: true
      value: <+input>


```

## 2. Create your github repository for onboarding and add the manifest.tf and variables.tf to it 


## 3. When executing us the input set or input the variables for the tenant atrributes 

### HARNESS_ORG_ID

- **Type**: String
- **Description**: The identifier for the Harness organization where the project will be created.
- **Value**: `default`

### HARNESS_GITHUB_URL

- **Type**: String
- **Description**: The URL of the GitHub repository containing the Terraform scripts.
- **Value**: `https://github.com/gregkroon`

### HARNESS_COST_ESTIMATION_ENABLED

- **Type**: String
- **Description**: Enables or disables cost estimation for the project. Set to `true` to enable.
- **Value**: `true`

### HARNESS_REPO_PATH

- **Type**: String
- **Description**: The path to the repository in GitHub. Use `.` for the root path.
- **Value**: `.`

### HARNESS_REPO_BRANCH

- **Type**: String
- **Description**: The branch of the repository to use for the pipeline.
- **Value**: `main`

### HARNESS_PROJECT_ID

- **Type**: String
- **Description**: The identifier for the new project being provisioned within Harness.
- **Value**: `ProjectA`

### HARNESS_PROVISIONER_VERSION

- **Type**: String
- **Description**: The version of the provisioner to be used.
- **Value**: `1.5.6`

### HARNESS_PROVISIONER_TYPE

- **Type**: String
- **Description**: The type of provisioner being used, such as Terraform.
- **Value**: `terraform`

### HARNESS_REPO

- **Type**: String
- **Description**: The repository name where Terraform configurations are stored.
- **Value**: `terraform-s3`

### HARNESS_WORKSPACE_ID

- **Type**: String
- **Description**: The identifier for the workspace within the new project.
- **Value**: `ProjectA`

---

