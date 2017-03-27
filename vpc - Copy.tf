####### VPC #######
resource "aws_vpc" "vpc_terraform_test" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "VPC_Terraform_Test"
  }
}   

####### INTERNET GATEWAY #######
resource "aws_internet_gateway" "aws_ig" {
  vpc_id = "${aws_vpc.vpc_terraform_test.id}"
  tags {
        Name = "InternetGateway"
    }
}


####### ROUTE TABLE FOR THE IG #######
resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.vpc_terraform_test.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.aws_ig.id}"
}


####### ROUTE TABLE FOR THE IG #######
resource "aws_eip" "IG_eip" {
  vpc      = true
  depends_on = ["aws_internet_gateway.aws_ig"]
}


####### NAT GATEWAY  #######
resource "aws_nat_gateway" "aws_nat" {
    allocation_id = "${aws_eip.IG_eip.id}"
    subnet_id = "${aws_subnet.public_1_subnet_us_east_1a.id}"
    depends_on = ["aws_internet_gateway.aws_ig"]
}
