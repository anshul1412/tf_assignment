provider "aws" {
    region = "us-east-1"
}

resource "aws_iam_user" "qausers" {
    #count = var.number
    #name = var.qausernames[count.index]
    name ="${var.qausernames}"
    path                 = var.path-qa
    force_destroy        = var.force_destroy-qa
    tags = {
        "testuser" = "${aws_iam_user.qausers.name}"
    }
}

#Create IAM access key
resource "aws_iam_access_key" "qa-key"{
  user = aws_iam_user.qausers.name
}

resource "aws_iam_user_policy" "qapolicy" {
  user = aws_iam_user.qausers.name
  policy = module.IamPolicyQA.policy
}


module "IamPolicyQA" {
  source = "../Policy/IamPolicyQA"
}