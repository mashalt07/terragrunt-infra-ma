variable "name" {
}

variable "email" {
    sensitive = true
}

variable "close_on_deletion" {
    default = true
}
