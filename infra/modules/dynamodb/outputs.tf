output "driver_table_name" {
  value = aws_dynamodb_table.driver.name
}

output "rider_table_name" {
  value = aws_dynamodb_table.rider.name
}