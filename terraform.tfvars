#####################################
#Common:
region = "us-west-1"
tags = {
  "Environment"    = "Prod",
  "Deployment"     = "CK_Automation"
  "Project"        = "MOE_Test"  
}

#AWS CLI Profile

#profile = "CK-Sandbox"

#######################################################################
# CloudTrail logs delivery failures to S3Bucket Compilance Variables
#######################################################################
# Cloudwatch Log Metric Variables
cloudtrail_log_delivery_failure_log_group_name = ""

# Cloudwatch Alarm Variables
cloudtrail_log_delivery_failure_alarm_name = ""

# SNS Topic & Subscription Variables
cloudtrail_log_delivery_failure_sns_display_name = ""
cloudtrail_log_delivery_failure_sns_email_addresses = [""]
cloudtrail_log_delivery_failure_sns_protocol = ""
cloudtrail_log_delivery_failure_sns_stack_name = ""

##########################################
# VPC Changes Compilance Variables
##########################################
# Cloudwatch Log Metric Variables
vpc_changes_log_group_name = ""

# Cloudwatch Alarm Variables
vpc_changes_alarm_name = ""

# SNS Topic & Subscription Variables
vpc_changes_sns_display_name = ""
vpc_changes_sns_email_addresses = [""]
vpc_changes_sns_protocol = ""
vpc_changes_sns_stack_name = ""

##########################################
# CMKS Changes Compilance Variables
##########################################
# Cloudwatch Log Metric Variables
cmks_changes_log_group_name = ""

# Cloudwatch Alarm Variables
cmks_changes_alarm_name = ""

# SNS Topic & Subscription Variables
cmks_changes_sns_display_name = ""
cmks_changes_sns_email_addresses = [""]
cmks_changes_sns_protocol = ""
cmks_changes_sns_stack_name = ""

##########################################
# IAM Policy Changes Compilance Variables 
##########################################
# Cloudwatch Event Rule Creation Variables
iam_policy_changes_event_rule_name = ""

# SNS Topic & Subscription Variables
iam_policy_changes_sns_display_name = ""
iam_policy_changes_sns_email_addresses = [""]
iam_policy_changes_sns_protocol = ""
iam_policy_changes_sns_stack_name = ""

# Cloudwatch Target For Event Rule Creation Variables
iam_policy_changes_cw_tg_event_rule_event_rule_name = ""

##############################################################
# Management Console sign-in without MFA Compilance Variables
##############################################################
# Cloudwatch Log Metric Variables
sign_in_without_mfa_log_group_name = ""

# Cloudwatch Alarm Variables
sign_in_without_mfa_alarm_name = ""

# SNS Topic & Subscription Variables
sign_in_without_mfa_sns_display_name = ""
sign_in_without_mfa_sns_email_addresses = [""]
sign_in_without_mfa_sns_protocol = ""
sign_in_without_mfa_sns_stack_name = ""

###############################################
# Network Gateways Changes Compilance Variables
###############################################
# Cloudwatch Log Metric Variables
network_gw_changes_log_group_name = ""

# Cloudwatch Alarm Variables
network_gw_changes_alarm_name = ""

# SNS Topic & Subscription Variables
network_gw_changes_sns_display_name = ""
network_gw_changes_sns_email_addresses = [""]
network_gw_changes_sns_protocol = ""
network_gw_changes_sns_stack_name = ""

########################################################
# CloudTrail Configuration Changes Compilance Variables
########################################################
# Cloudwatch Log Metric Variables
cloudtrail_changes_log_group_name = ""

# Cloudwatch Alarm Variables
cloudtrail_changes_alarm_name = ""

# SNS Topic & Subscription Variables
cloudtrail_changes_sns_display_name = ""
cloudtrail_changes_sns_email_addresses = [""]
cloudtrail_changes_sns_protocol = ""
cloudtrail_changes_sns_stack_name = ""

#########################################################
# AWS Config configuration changes Compilance Variables
#########################################################
# Cloudwatch Log Metric Variables
aws_config_changes_log_group_name = ""

# Cloudwatch Alarm Variables
aws_config_changes_alarm_name = ""

# SNS Topic & Subscription Variables
aws_config_changes_sns_display_name = ""
aws_config_changes_sns_email_addresses = [""]
aws_config_changes_sns_protocol = ""
aws_config_changes_sns_stack_name = ""

#######################################################
# Console Authentication failures Compilance Variables
#######################################################
# Cloudwatch Log Metric Variables
authentication_failures_log_group_name = ""

# Cloudwatch Alarm Variables
authentication_failures_alarm_name = ""

# SNS Topic & Subscription Variables
authentication_failures_sns_display_name = ""
authentication_failures_sns_email_addresses = [""]
authentication_failures_sns_protocol = ""
authentication_failures_sns_stack_name = ""

##########################################
# Root Account login Compilance Variables
##########################################
# Cloudwatch Log Metric Variables
root_login_log_group_name = ""

# Cloudwatch Alarm Variables
root_login_alarm_name = ""

# SNS Topic & Subscription Variables
root_login_sns_display_name = ""
root_login_sns_email_addresses = [""]
root_login_sns_protocol = ""
root_login_sns_stack_name = ""

###############################################
# Unauthorized API Calls Compilance Variables
###############################################
# Cloudwatch Log Metric Variables
unauthorized_access_log_group_name = ""

# Cloudwatch Alarm Variables
unauthorized_access_alarm_name = ""

# SNS Topic & Subscription Variables
unauthorized_access_sns_display_name = ""
unauthorized_access_sns_email_addresses = [""]
unauthorized_access_sns_protocol = ""
unauthorized_access_sns_stack_name = ""
