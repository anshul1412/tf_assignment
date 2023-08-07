provider "aws" {
    region = "us-east-1"
}

module "iamdev" {
    source = "../dev"
    path-dev = var.path-users
    force_destroy-dev = var.force_destroy-users
    numberofusers-dev = var.numberofusers-user
    #devuser should be in child's(Iam/dev) var.tf
    devuser-dev = var.role-user == "dev" ? "devuser" : "qauser"
}

module "iamqa" {
    source = "../qa"
    path-qa = var.path-users
    force_destroy-qa = var.force_destroy-users
    
    #qauser should be in child's (Iam/qa) var.tf
    qauser-qa = var.role-user == "qa" ? "qauser" : "devuser"
}


# Following 2 are from the class. However, I am doing condition as above, to call the module that is
# Calling IAMPolicy module (i.e. from User --> Dev/QA --> Policy) by providing module block 
# in Dev and QA's main.tf

#module "IamPolicyDev" {
#  source = "../IamPolicyDev"
#}

#module "IamPolicyQA" {
#  source = "../IamPolicyQA"
#}