variable "numberofusers-dev"{
    default = 1
}

variable "path-dev"{
    description = "Desired path for the IAM user"
    type        = string
    default     = "/"
}

variable "force_destroy-dev"{
    description = "Allow force destroy"
    type        = bool
    default     = true
}

variable "devuser-dev"{
    default = "devuser"
}