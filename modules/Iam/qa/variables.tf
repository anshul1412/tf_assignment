variable "path-qa"{
    description = "Desired path for the IAM user"
    type        = string
    default     = "/"
}

variable "force_destroy-qa"{
    description = "Allow force destroy"
    type        = bool
    default     = true
}

variable "qauser-qa"{
    default = "qauser"
}

#This is the loop for Onyl QA names
variable "qausernames" {
    type = list(string)
    default = ["qa1","qa2","qa3","qa4"]
}
