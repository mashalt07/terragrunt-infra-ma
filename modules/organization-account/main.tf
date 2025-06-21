# Resource for creating a member account in an AWS organization.
resource "aws_organizations_account" "this" {
  name  = var.name
  email = var.email 
  close_on_deletion = var.close_on_deletion
}