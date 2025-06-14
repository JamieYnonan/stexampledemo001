variable "rg_name" {
  type        = string
  description = <<DESCRIPTION
  The name of the resource group.
  It must consist of lowercase letters and numbers, and have a length between 3 and 63 characters.

  Changing this forces a new resource to be created.
  DESCRIPTION
  nullable    = false

  validation {
    condition     = can(regex("^rg-[a-z0-9-]{3,56}-[0-9]{3}$", var.rg_name))
    error_message = "The value must consist of lowercase letters and numbers, and have a length between 3 and 63 characters"
  }
}

variable "st_instance" {
  type        = number
  description = <<DESCRIPTION
  The storage account instance.
  It must be greater than or equal to 1 and less than or equal to 999.

  Changing this forces a new resource to be created.
  DESCRIPTION
  nullable    = false

  validation {
    condition     = var.st_instance >= 1 && var.st_instance <= 999
    error_message = "The storage account instance must be greater than or equal to 1 and less than or equal to 999"
  }
}

variable "st_project" {
  type        = string
  description = <<DESCRIPTION
  The project name.
  It must be lowercase and have a length between 3 and 18 characters.

  Changing this forces a new resource to be created.
  DESCRIPTION
  nullable    = false

  validation {
    condition     = can(regex("^[a-z]{3,18}$", var.st_project))
    error_message = "The project name must be lowercase and have a length between 3 and 18 characters"
  }
}

variable "container_name" {
  type        = string
  description = <<DESCRIPTION
  The value must consist of lowercase letters and numbers, and have a length between 3 and 63 characters

  Changing this forces a new resource to be created.
  DESCRIPTION
  nullable    = false

  validation {
    condition     = can(regex("^[a-z0-9]{3,63}$", var.container_name))
    error_message = "The value must consist of lowercase letters and numbers, and have a length between 3 and 63 characters"
  }
}

