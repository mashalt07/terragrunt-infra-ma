# Multi Account Terragrunt Infrastructure Setup

This repository is a personal setup of my infrastructure on AWS using Terragrunt. Terragrunt is a thin wrapper for Terraform that provides features such as keeping your remote state configuration and terraform code DRY. 

For more information on Terragrunt, check out the [official documentation](https://terragrunt.gruntwork.io/docs/getting-started/quick-start/).

## Accounts Structure

The AWS accounts have been setup using AWS organizations. AWS organizations allow the central management and governance of multiple AWS accounts as a single unit, from the management account. 


```bash
├── management-account
│   ├── account.hcl
│   ├── eu-west-1
│   │   ├── region.hcl
│   │   └── s3
│   │       └── terragrunt.hcl
│   └── global-infra
│       └── organization-accounts
│           └── terragrunt.hcl
├── modules # Reusable terraform modules.
│   ├── organization-account
│   │   ├── main.tf
│   │   └── variables.tf
│   └── s3
│       ├── outputs.tf
│       ├── s3.tf
│       └── variables.tf
├── playground-account
│   ├── account.hcl
│   └── eu-west-1
│       ├── region.hcl
│       └── s3
│           └── terragrunt.hcl
├── README.md
├── root.hcl
└── test-account
    ├── account.hcl
    └── eu-west-1
        ├── region.hcl
        └── s3
            └── terragrunt.hcl
```