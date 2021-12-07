# Provider
provider "aws" {
  version     = "2.63.0"
  region      = var.region
  profile     = var.profile
}


# Resource creation for Cloudwatch alarm
resource "aws_cloudwatch_metric_alarm" "CwAlarm" {
  alarm_name            = var.alarm_name
  alarm_description     = var.alarm_description
  metric_name           = var.metric_name
  namespace             = var.namespace
  statistic             = "Sum"
  period                = "300"
  threshold             = "1"
  evaluation_periods    = "1"
  comparison_operator   = "GreaterThanOrEqualToThreshold"
  alarm_actions         = [ "${var.alarm_actions}" ]
  treat_missing_data    = "notBreaching"
} 