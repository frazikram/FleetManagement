resource "aws_sns_topic" "notifications" {
  name = "fleet-notifications"

  tags = {
    Name = "fleet-notifications"
  }
}
