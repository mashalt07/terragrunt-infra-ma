# Multi Account Terragrunt Infrastructure Setup

This repository is a personal setup of my infrastructure on AWS using Terragrunt. Terragrunt is a thin wrapper for Terraform that provides features such as keeping your remote state configuration and terraform code DRY. 

For more information on Terragrunt, check out the [official documentation](https://terragrunt.gruntwork.io/docs/getting-started/quick-start/).

 ## Directory Layout

The AWS accounts have been setup using AWS organizations. AWS organizations allow the central management and governance of multiple AWS accounts as a single unit, from the management account. 


```bash
├── management-account
├── modules
├── playground-account
├── README.md
└── root.hcl
```