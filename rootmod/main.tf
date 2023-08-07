module "instance"{
    source = "../modules/instance"
    #key_name = var.pem
    storage-instance = var.storage
    type-instance = var.type  #type-instance must match the var "name" in the child module(instance's) var file
    #iamtype = var.iamtype
    #this condition is to detrmine which maodule to call and what amiid to pass based on iamrole

    #amiid-instance must match the "name" of the var in child module (instance's) var file entry
    amiid-instance = var.iamtype == "dev" ?  var.amiid.amiid1 : var.amiid.amiid2
}

module "iamuser" {
     #root is calling Iam user. 
     #from there we will pass the var.role value to call IamDev or IamQA along with policy information
    source = "../modules/Iam/user"

    #role-user must match the "name" of the var in child module (Iam/user's) var file entry
    role-user = var.iamtype 
    
    #role-user = role == "dev" ? Iam.dev : Iam.qa
    #qausers-user = var.qausernames
    
    numberofusers-user  = var.number
}

#module "iam_qa" {
#    source ="./Iam/qa"
#    name = qa1
#}
