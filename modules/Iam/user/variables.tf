
# following 2 are the varbale we used in the class, this assignment logic is diffrent in the sense
# I am passing var role = dev or qa at the Terrrform plan to determine the role and therefore 
# I have in Iam/user's main.tf, a condition to check the role's value and select the username from there

# so, I may not need the below 2 for this case. 
# in class root was calling Iam/user child module and passing the name variable
# in that root's main.tf was passing qauser or devuser = 1  and name ="testuser"/"devuser" by default


#variable "devuser" {
#    description = "based on input create dev or qa users in loop"
#    type = bool
#    default = "Company_dev1"
#}

#variable "qauser"{
#    description = "based on input create dev or qa users in loop"
#    type = bool
#    default = "qa1"
#}

#TO CREATE THE USER, YOU NEED PATH AND FORCE DESTROY VARIABLES
variable "path-users" {
  description = "Desired path for the IAM user"
  type        = string
  default     = "/"
}

variable "force_destroy-users" {
  description = "Allow force destroy"
  type        = bool
  default     = true
}

# Following 2 are additional variable from this module's main.tf
# qauser = var.role == "qa" ? "qauser" : "devuser" requiers var.role and 
# 1.numberofusers = var.number
# 2.devuser = var.role == "dev" ? "devuser" : "qauser" needs the role and number for the loop count for dev

variable "numberofusers-user" {
  default = 1
} 

variable "role-user" {
  default = "dev"
}

variable "qausers-user"{
  default = ["qa1"]
}