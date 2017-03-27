####### INTERNET GATEWAY #######

resource "aws_route_table" "private_route_table" {
    vpc_id = "${aws_vpc.vpc_terraform_test.id}"

    tags {
        Name = "Private route table"
    }
}


####### INTERNET GATEWAY #######
resource "aws_route" "private_route" {
	route_table_id  = "${aws_route_table.private_route_table.id}"
	destination_cidr_block = "0.0.0.0/0"
	nat_gateway_id = "${aws_nat_gateway.aws_nat.id}"
}


############ Associate subnet private_1_subnet_us_east_1a to private route table
resource "aws_route_table_association" "private_1_subnet_us_east_1a_association" {
    subnet_id = "${aws_subnet.private_1_subnet_us_east_1a.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}

############ Associate subnet private_1_subnet_us_east_1b to private route table
resource "aws_route_table_association" "private_1_subnet_us_east_1b_association" {
    subnet_id = "${aws_subnet.private_2_subnet_us_east_1b.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}

############ Associate subnet public_1_subnet_us_east_1a to public route table
resource "aws_route_table_association" "public_1_subnet_us_east_1a_association" {
    subnet_id = "${aws_subnet.public_1_subnet_us_east_1a.id}"
    route_table_id = "${aws_vpc.vpc_terraform_test.main_route_table_id}"
}

############ Associate subnet public_1_subnet_us_east_1b to public route table
resource "aws_route_table_association" "public_1_subnet_us_east_1b_association" {
    subnet_id = "${aws_subnet.public_2_subnet_us_east_1b.id}"
    route_table_id = "${aws_vpc.vpc_terraform_test.main_route_table_id}"
}
