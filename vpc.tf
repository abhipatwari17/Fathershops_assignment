# VPC
resource "aws_vpc" "default" {
    cidr_block = "10.0.0.0/16"

    tags = {
       Name = "wp-pvc-tf"
    }
}

# Internet Gateway
resource "aws_internet_gateway" "default" {
    vpc_id = aws_vpc.default.id

    tags = {
       Name = "wp-igw-tf"
    }
}

# Public Subnet
resource "aws_subnet" "wp-public-tf" {
    vpc_id            = aws_vpc.default.id
    cidr_block        = "10.0.1.0/24"
    availability_zone = "us-west-2a"

    tags = {
       Name = "wp-public-tf"
    }
}
#private subnets
resource "aws_subnet" "wp-private-tf" {
  for_each = toset(var.private_subnet_cidr_blocks)

  vpc_id            = aws_vpc.default.id
  cidr_block        = each.value
  availability_zone = lookup(zipmap(var.private_subnet_cidr_blocks, split(",", var.availability_zones)), each.value, null)

  tags = {
    Name = "wp-private-tf-${each.value}"
  }

    lifecycle {
      ignore_changes = [tags]  # Ignore changes to tags
    }
}


# Route Tables
resource "aws_route_table" "wp-rt-private-tf" {
    vpc_id = aws_vpc.default.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.default.id
    }

    tags = {
        Name = "wp-rt-private-tf"
    }
}

# Route Table Associations
# Route Table Associations
resource "aws_route_table_association" "wp-private-tf" {
    for_each       = aws_subnet.wp-private-tf
    subnet_id      = each.value.id
    route_table_id = aws_route_table.wp-rt-private-tf.id
}


# Route Tables for Public
resource "aws_route_table" "wp-rt-public-tf" {
    vpc_id = aws_vpc.default.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.default.id
    }

    tags = {
       Name = "wp-rt-public-tf"
    }
}

resource "aws_route_table_association" "wp-public-tf" {
    count          = length(aws_subnet.wp-public-tf)
    subnet_id      = aws_subnet.wp-public-tf.id
    route_table_id = aws_route_table.wp-rt-public-tf.id
}
