provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "Ky_Spl_Server" {
    ami           = "ami name here" # us-east-1 AMI for Splunk
    instance type = "t3.large"
    associate_public_ip_address = true
    vpc_security_group_ids = ["${aws_security_group.splunk_server.id}"]
    subnet_id              = "${aws_subnet.splunk_server.id}"
}

resource "aws_security_group" "Ky_Spl_Server" {
    name_prefix = "splunk-group"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["<your ip>/32"]
    }
        ingress {
        from_port   = 8000 #splunk UI port
        to_port     = 8000
        protocol    = "tcp"
        cidr_blocks = ["<your ip>/32"]
    }
}


resource "aws_subnet" "Ky_Spl_Server" {
    vpc_id = "vpc here"
    cidr_block = "172.31.1.0/28
}