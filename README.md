# Multi Account Terragrunt Infrastructure Setup

This repository is a personal setup of my infrastructure on AWS using Terragrunt. Terragrunt is a thin wrapper for Terraform that provides features such as keeping your remote state configuration and terraform code DRY. 

For more information on Terragrunt, check out the [official documentation](https://terragrunt.gruntwork.io/docs/getting-started/quick-start/).

 ## Directory Layout

The AWS accounts have been setup using AWS organizations. AWS organizations allow the central management and governance of multiple AWS accounts as a single unit, from the management account. 


```bash
├── management-account 
├── modules # Resuable terraform modules
├── playground-account
├── README.md
├── root.hcl
└── test-account
```

Each account is split up into its own folder. A typical account directory structure looks as follows:

```bash
├── account.hcl
├── eu-west-1
│   ├── region.hcl
│   └── s3
│       └── terragrunt.hcl
└── global-infra
    └── organization-accounts
        └── terragrunt.hcl
```
The `account.hcl` contains the common configurations for an account. Region specific resources are deployed in their own folders