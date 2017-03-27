####### PRIVATE SUBNET #######
resource "aws_subnet" "private_1_subnet_us_east_1a" {
  vpc_id                  = "${aws_vpc.vpc_terraform_test.id}"
  cidr_block              = "${var.private_subnet1}"
  availability_zone = "${var.az1}"
  tags = {
  	Name =  "Subnet private 1 az 1a"
  }
}

resource "aws_subnet" "private_2_subnet_us_east_1b" {
  vpc_id                  = "${aws_vpc.vpc_terraform_test.id}"
  cidr_block              = "${var.private_subnet2}"
  availability_zone = "${var.az2}"
  tags = {
  	Name =  "Subnet private 2 az 1b"
  }
}

####### PUBLIC SUBNET #######

resource "aws_subnet" "public_1_subnet_us_east_1a" {
  vpc_id                  = "${aws_vpc.vpc_terraform_test.id}"
  cidr_block              = "${var.public_subnet1}"
  availability_zone = "${var.az1}"
  tags = {
  	Name =  "Subnet public 1 az 1a"
  }
}

resource "aws_subnet" "public_2_subnet_us_east_1b" {
  vpc_id                  = "${aws_vpc.vpc_terraform_test.id}"
  cidr_block              = "${var.public_subnet2}"
  availability_zone = "${var.az2}"
  tags = {
  	Name =  "Subnet public 2 az 1b"
  }
}
