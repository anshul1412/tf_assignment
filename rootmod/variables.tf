variable "amiid" {
    type = map 
    default = {
    "amiid1" = "ami-053b0d53c279acc90" # for dev ubuntu image
    "amiid2" = "ami-0f34c5ae932e6f0e4" # for qa AWS image
    }
}

variable "type" {
    default = "t2.micro"
}

variable "iamtype" {
    type = list
    default = ["dev","qa"]
}

variable "storage" {
    default = 8
}

#This variable will capture the number of users to be creates for role
variable "number" {
    default = 1
}

#Commenting this as I am getting errors passing this list at root level
#Moving it to qa's module's variable.tf
#This is the loop for Onyl QA names
#variable "qausernames" {
#    type = list
#    default = ["a1,a2,a3,a4"]
#}

#variable "pem" {
#    pem = "/tf-key-pair"
#}

#variable "servers" {
#    server_nummber = "2"
#}

#sing this to define at the run of the program to determine QA or DEV role
#variable "role" {
#    default = "dev"
#}