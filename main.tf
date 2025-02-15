
# # Create Random Pet Resource
# resource "random_pet" "this" {
#   length = 2
#   prefix = "hashi" 
# }

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

//Create a VPC
resource "aws_vpc" "example" {
  cidr_block = var.cidrBlock

  tags = {
    Name = "mytestvpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = var.subnet_cidr
  availability_zone = "us-east-1a"
  #availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    #Name = random_pet.this.id
    Name = "testing server"
  }
}

# data "aws_ami" "ubuntu" {
#     most_recent = true
 
#     filter {
#         name   = "name"
#         values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#     }
 
#     filter {
#         name   = "virtualization-type"
#         values = ["hvm"]
#     }
 
#     filter {
#         name   = "architecture"
#         values = ["x86_64"]
#     }
# }

resource "aws_instance" "web" { 
  ami           = var.local-ami
  instance_type = var.instanceTypes
  subnet_id     = aws_subnet.my_subnet.id
 
  tags = {
    #Name = random_pet.this.id    
    Name = "test instance"
  }
}

# resource "aws_s3_bucket" "michaelsbucket" {
#   bucket = "my-tf-test-bucket-elvis"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }


# resource "aws_s3_bucket_policy" "bucket_policy" {
#   bucket = "${aws_s3_bucket.michaelsbucket.id}"

#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "AWS": "${var.user_arn}"
#       },
#       "Action": [ "s3:PutObject" ],
#       "Resource": [
#         "${aws_s3_bucket.michaelsbucket.arn}/*"        
#       ]
#     },
#     {
#       "Sid": "PublicRead",
#       "Effect": "Allow",
#       "Principal": "*",
#       "Action": [
#           "s3:GetObject",
#           "s3:GetObjectVersion"
#       ],
#       "Resource": [
#           "${aws_s3_bucket.michaelsbucket.arn}/*" 
#       ]
#     }
#   ]
# }
# EOF
# }


# output "petname" {
#   value = random_pet.this.id
# }





