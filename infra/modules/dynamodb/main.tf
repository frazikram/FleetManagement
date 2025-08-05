resource "aws_dynamodb_table" "driver" {
  name         = "DriverTable"
  billing_mode = "PAY_PER_REQUEST"

  hash_key     = "driverId"

  attribute {
    name = "driverId"
    type = "S"
  }

  tags = {
    Name = "DriverTable"
  }
}
resource "aws_dynamodb_table" "rider" {
  name         = "RiderTable"
  billing_mode = "PAY_PER_REQUEST"

  hash_key     = "riderId"

  attribute {
    name = "riderId"
    type = "S"
  }

  tags = {
    Name = "RiderTable"
  }
}