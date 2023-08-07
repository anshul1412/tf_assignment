provider "aws" {
    region = "us-east-1"
}

# Instead of passing the individual names for practice
# I am passing values using count loop Company_dev1, Company_dev2 etc...
resource "aws_iam_user" "devusers" {
    count = var.numberofusers-dev
    name = "Company_dev.${count.index}"
    path                 = var.path-dev
    force_destroy        = var.force_destroy-dev 
    tags = {
      "testuser" = "${aws_iam_user.devusers.name[0]}"
    }
}

#Create IAM access key
resource "aws_iam_access_key" "dev-key"{
  user = aws_iam_user.devusers.name
}

resource "aws_iam_user_policy" "devpolicy" {
  user = aws_iam_user.devusers.name
  policy = module.IamPolicyDev.policy
}

module "IamPolicyDev" {
  source = "../Policy/IamPolicyDev"
}