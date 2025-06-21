variable "name" {
    description = "Name of the account."
}

variable "email" {
    description = "Email address of the owner to assign to the new member account"
    sensitive = true
}

variable "close_on_deletion" {
    description = "Whether to close the account on a deletion event."
    default = true
}
