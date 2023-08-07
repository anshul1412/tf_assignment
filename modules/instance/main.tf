provider "aws" {
    region = "us-east-1"
}

resource "tls_private_key" "rsa" {
    algorithm = "RSA"
    rsa_bits  = 4096
}      

resource "aws_key_pair" "tf-key-pair" {
    key_name = "tf-key-pair"
    public_key = tls_private_key.rsa.public_key_openssh

    #provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
    #command = "echo '${tls_private_key.pk.private_key_pem}' > ./myKey.pem"
    #}
}

resource "local_file" "tf-key" {
    filename = "${aws_key_pair.tf-key-pair.key_name}.pem"
    content  = tls_private_key.rsa.private_key_pem
}



resource "aws_instance" "tf_ass_dev" {
    ami           =  var.amiid-instance
    instance_type =  var.type-instance
    key_name = local_file.tf-key.filename

    ebs_block_device {
        device_name = "/dev/sda1"
        volume_size = var.storage-instance
        }

}   

resource "aws_instance" "tf_ass_qa" {
    ami           =  var.amiid-instance
    instance_type =  var.type-instance
    key_name = local_file.tf-key.filename

    ebs_block_device {
        device_name = "/dev/sda1"
        volume_size = var.storage-instance
        }
}