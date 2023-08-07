#creatind amiid-instance with -instance to differentiate where the variable is created 
#and how it is linked to root's variable

variable "amiid-instance" {
    default = "ami-053b0d53c279acc90"
}

variable "storage-instance" {
    default = 8
}

variable "type-instance" {
    default = "t2.micro"
}