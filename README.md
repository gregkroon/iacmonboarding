### Example YAML

 yaml = <<-EOT
  pipeline:
    name: onboarding
    identifier: onboarding
    projectIdentifier: ${var.HARNESS_PROJECT_ID}
    orgIdentifier: ${var.HARNESS_ORG_ID}
    tags: {}
    stages:
      - stage:
          name: onboarding
          identifier: onboarding
          description: ""
          type: IACM
          spec:
            workspace: ${harness_platform_workspace.workspace.identifier}
            execution:
              steps:
                - step:
                    type: IACMTerraformPlugin
                    name: init
                    identifier: init
                    timeout: 10m
                    spec:
                      command: init
                - step:
                    type: IACMTerraformPlugin
                    name: plan
                    identifier: plan
                    timeout: 10m
                    spec:
                      command: plan
                - step:
                    type: IACMTerraformPlugin
                    name: apply
                    identifier: apply
                    timeout: 10m
                    spec:
                      command: apply
            infrastructure:
              type: KubernetesDirect
              spec:
                connectorRef: account.k8s
                namespace: default
                volumes: []
                annotations: {}
                labels: {}
                automountServiceAccountToken: true
                nodeSelector: {}
                containerSecurityContext:
                  capabilities:
                    drop: []
                    add: []
                os: Linux
                hostNames: []
          tags: {}
  EOT
