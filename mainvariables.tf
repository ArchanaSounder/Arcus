# Common Variables
variable "profile" {
  description = "Name of AWS profile"
  default = "default"
}

variable "region" {
  description = "Region to deploy AWS Resources in"
}

variable "tags" {
  description = "The tags to be added to the resources"
  default = {}
  type = map(string)
}


# CloudTrail logs delivery failures to S3Bucket Compliance Variables

# Cloudwatch Log Metric Variables
variable "cloudtrail_log_delivery_failure_log_group_name" {
  description  = "The name of log group"   
}

variable "cloudtrail_log_delivery_failure_filter_pattern" {
  description  = "The name of the filter pattern" 
  default      = "{($.eventName = PutObject)&&($.eventSource = s3.amazonaws.com)&&($.userAgent = cloudtrail.amazonaws.com)&&($.errorCode = AccessDenied)}"
}

variable "cloudtrail_log_delivery_failure_event_name" {
  description  = "The name of the event"  
  default      = "CloudTrailLogDeliveryFailureCount"  
}

variable "cloudtrail_log_delivery_failure_metric_transformation_namespace" {
  description  = "The name of the metric transformation"
  default      = "CloudTrailLogDeliveryFailureMetrics"    
}

# Cloudwatch Alarm Variables
variable "cloudtrail_log_delivery_failure_alarm_name" {
  description  = "Tha Name to be used for cloudwatch alarm"
  default      = "CloudTrailLogDeliveryFailureAlarm"    
}

variable "cloudtrail_log_delivery_failure_alarm_description" {
  description  = "Tha Name to be used for cloudwatch alarm description"
  default      = "A CloudWatch Alarm that triggers when cloudtrail log delivery to s3 bucket fails"     
}

variable "cloudtrail_log_delivery_failure_metric_name" {
  description  = "The Name of the metric to be used in the cloudwatch alarm"
  default      = "CloudTrailLogDeliveryFailureCount"    
}

variable "cloudtrail_log_delivery_failure_namespace" {
  description  = "The Name of the namespace to be used in the cloudwatch alarm"
  default      = "CloudTrailLogDeliveryFailureMetrics"    
}

# SNS Topic & Subscription Variables
variable "cloudtrail_log_delivery_failure_sns_display_name" {
  type        = string
  description = "Name shown in confirmation emails"
}

variable "cloudtrail_log_delivery_failure_sns_email_addresses" {
  type        = list(string)
  description = "Email address to send notifications to"
}

variable "cloudtrail_log_delivery_failure_sns_protocol" {
  default     = "email"
  description = "SNS Protocol to use. email or email-json"
  type        = string
}

variable "cloudtrail_log_delivery_failure_sns_stack_name" {
  type        = string
  description = "Unique Cloudformation stack name that wraps the SNS topic."
}



# VPC Changes Compliance Variables

# Cloudwatch Log Metric Variables
variable "vpc_changes_log_group_name" {
  description = "The name of log group"    
}

variable "vpc_changes_filter_pattern" {
  description = "The name of the filter pattern"
  default     = "{ ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) || ($.eventName = ModifyVpcAttribute) || ($.eventName = AcceptVpcPeeringConnection) || ($.eventName = CreateVpcPeeringConnection) || ($.eventName = DeleteVpcPeeringConnection) || ($.eventName = RejectVpcPeeringConnection) || ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) || ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink) }"    
}

variable "vpc_changes_event_name" {
  description  = "The name of the event"    
  default      = "VpcEventCount"
}

variable "vpc_changes_metric_transformation_namespace" {
  description  = "The name of the metric transformation"
  default      = "CloudTrailMetrics"
}

# Cloudwatch Alarm Variables
variable "vpc_changes_alarm_name" {
  description  = "Tha Name to be used for cloudwatch alarm"
  default      = "vpc_changes"    
}

variable "vpc_changes_alarm_description" {
  description  = "Tha Name to be used for cloudwatch alarm description"
  default      = "A CloudWatch Alarm that triggers when changes are made to a VPC."    
}

variable "vpc_changes_metric_name" {
  description  = "The Name of the metric to be used in the cloudwatch alarm"    
  default      = "VpcEventCount"  
}

variable "vpc_changes_namespace" {
  description  = "The Name of the namespace to be used in the cloudwatch alarm"    
  default      = "CloudTrailMetrics"
}

# SNS Topic & Subscription Variables
variable "vpc_changes_sns_display_name" {
  type        = string
  description = "Name shown in confirmation emails"
}

variable "vpc_changes_sns_email_addresses" {
  type        = list(string)
  description = "Email address to send notifications to"
}

variable "vpc_changes_sns_protocol" {
  default     = "email"
  description = "SNS Protocol to use. email or email-json"
  type        = string
}

variable "vpc_changes_sns_stack_name" {
  type        = string
  description = "Unique Cloudformation stack name that wraps the SNS topic."
}


# CMKS Changes Compliance Variables

# Cloudwatch Log Metric Variables
variable "cmks_changes_log_group_name" {
  description = "The name of log group"    
}

variable "cmks_changes_filter_pattern" {
  description = "The name of the filter pattern"    
  default = "{ ($.eventSource = kms.amazonaws.com) &&  (($.eventName=DisableKey) || ($.eventName=ScheduleKeyDeletion)) }"
}

variable "cmks_changes_event_name" {
  description = "The name of the event"    
  default = "KMSCustomerKeyDeletion"
}

variable "cmks_changes_metric_transformation_namespace" {
  description = "The name of the metric transformation"
  default = "CloudTrailMetrics"    
}

# Cloudwatch Alarm Variables
variable "cmks_changes_alarm_name" {
  description = "Tha Name to be used for cloudwatch alarm"    
  default = "disabled_deleted_cmks"
}

variable "cmks_changes_alarm_description" {
  description = "Tha Name to be used for cloudwatch alarm description"    
  default = "A CloudWatch Alarm that triggers if customer created CMKs get disabled or scheduled for deletion."
}

variable "cmks_changes_metric_name" {
  description = "The Name of the metric to be used in the cloudwatch alarm"    
  default = "KMSCustomerKeyDeletion"
}

variable "cmks_changes_namespace" {
  description = "The Name of the namespace to be used in the cloudwatch alarm"    
  default = "CloudTrailMetrics"
}

# SNS Topic & Subscription Variables
variable "cmks_changes_sns_display_name" {
  type        = string
  description = "Name shown in confirmation emails"
}

variable "cmks_changes_sns_email_addresses" {
  type        = list(string)
  description = "Email address to send notifications to"
}

variable "cmks_changes_sns_protocol" {
  default     = "email"
  description = "SNS Protocol to use. email or email-json"
  type        = string
}

variable "cmks_changes_sns_stack_name" {
  type        = string
  description = "Unique Cloudformation stack name that wraps the SNS topic."
}


# IAM Policy Changes Compliance Variables 

# Cloudwatch Event Rule Creation Variables
variable "iam_policy_changes_event_rule_name" {
  description = "The Name of the Event Rule"
}

# SNS Topic & Subscription Variables
variable "iam_policy_changes_sns_display_name" {
  type        = string
  description = "Name shown in confirmation emails"
}

variable "iam_policy_changes_sns_email_addresses" {
  type        = list(string)
  description = "Email address to send notifications to"
}

variable "iam_policy_changes_sns_protocol" {
  default     = "email"
  description = "SNS Protocol to use. email or email-json"
  type        = string
}

variable "iam_policy_changes_sns_stack_name" {
  type        = string
  description = "Unique Cloudformation stack name that wraps the SNS topic."
}

# Cloudwatch Target For Event Rule Creation Variables
variable "iam_policy_changes_cw_tg_event_rule_event_rule_name" {
  description = "The Name of the Event Rule"
}


# Management Console sign-in without MFA Compliance Variables

# Cloudwatch Log Metric Variables
variable "sign_in_without_mfa_log_group_name" {
  description = "The name of log group"    
}

variable "sign_in_without_mfa_filter_pattern" {
  description = "The name of the filter pattern"    
  default = "{($.eventName = \"ConsoleLogin\") && ($.additionalEventData.MFAUsed != \"Yes\") && ($.responseElements.ConsoleLogin != \"Failure\") && ($.additionalEventData.SamlProviderArn NOT EXISTS) }"
}

variable "sign_in_without_mfa_event_name" {
  description = "The name of the event"  
  default = "ConsoleSigninWithoutMFA"
}

variable "sign_in_without_mfa_metric_transformation_namespace" {
  description = "The name of the metric transformation"    
  default = "CloudTrailMetrics"
}

# Cloudwatch Alarm Variables
variable "sign_in_without_mfa_alarm_name" {
  description = "Tha Name to be used for cloudwatch alarm"    
  default = "no_mfa_console_logins"
}

variable "sign_in_without_mfa_alarm_description" {
  description = "Tha Name to be used for cloudwatch alarm description"    
  default = "A CloudWatch Alarm that triggers if there is a Management Console sign-in without MFA."
}

variable "sign_in_without_mfa_metric_name" {
  description = "The Name of the metric to be used in the cloudwatch alarm"    
  default = "ConsoleSigninWithoutMFA"
}

variable "sign_in_without_mfa_namespace" {
  description = "The Name of the namespace to be used in the cloudwatch alarm"    
  default = "CloudTrailMetrics"
}

# SNS Topic & Subscription Variables
variable "sign_in_without_mfa_sns_display_name" {
  type        = string
  description = "Name shown in confirmation emails"
}

variable "sign_in_without_mfa_sns_email_addresses" {
  type        = list(string)
  description = "Email address to send notifications to"
}

variable "sign_in_without_mfa_sns_protocol" {
  default     = "email"
  description = "SNS Protocol to use. email or email-json"
  type        = string
}

variable "sign_in_without_mfa_sns_stack_name" {
  type        = string
  description = "Unique Cloudformation stack name that wraps the SNS topic."
}


# Network Gateways Changes Compliance Variables

# Cloudwatch Log Metric Variables
variable "network_gw_changes_log_group_name" {
  description = "The name of log group"    
}

variable "network_gw_changes_filter_pattern" {
  description = "The name of the filter pattern"    
  default = "{ ($.eventName = CreateCustomerGateway) || ($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) || ($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) || ($.eventName = DetachInternetGateway) }"
}

variable "network_gw_changes_event_name" {
  description = "The name of the event"
  default = "NetworkGwChangesEventCount"    
}

variable "network_gw_changes_metric_transformation_namespace" {
  description = "The name of the metric transformation"
  default = "NetworkGwChangesMetrics"    
}

# Cloudwatch Alarm Variables
variable "network_gw_changes_alarm_name" {
  description = "Tha Name to be used for cloudwatch alarm"
  default = "NetworkGwChanges_changes_Alarm"    
}

variable "network_gw_changes_alarm_description" {
  description = "Tha Name to be used for cloudwatch alarm description"
  default = "A CloudWatch Alarm that triggers when changes are made to Network Gateway."    
}

variable "network_gw_changes_metric_name" {
  description = "The Name of the metric to be used in the cloudwatch alarm"
  default = "NetworkGwChangesEventCount"    
}

variable "network_gw_changes_namespace" {
  description = "The Name of the namespace to be used in the cloudwatch alarm"
  default = "NetworkGwChangesMetrics"     
}

# SNS Topic & Subscription Variables
variable "network_gw_changes_sns_display_name" {
  type        = string
  description = "Name shown in confirmation emails"
}

variable "network_gw_changes_sns_email_addresses" {
  type        = list(string)
  description = "Email address to send notifications to"
}

variable "network_gw_changes_sns_protocol" {
  default     = "email"
  description = "SNS Protocol to use. email or email-json"
  type        = string
}

variable "network_gw_changes_sns_stack_name" {
  type        = string
  description = "Unique Cloudformation stack name that wraps the SNS topic."
}


# CloudTrail Configuration Changes Compliance Variables

# Cloudwatch Log Metric Variables
variable "cloudtrail_changes_log_group_name" {
  description = "The name of log group"    
}

variable "cloudtrail_changes_filter_pattern" {
  description = "The name of the filter pattern"    
  default = "{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }"
}

variable "cloudtrail_changes_event_name" {
  description = "The name of the event"    
  default = "CloudTrailEventCount"
}

variable "cloudtrail_changes_metric_transformation_namespace" {
  description = "The name of the metric transformation" 
  default = "CloudTrailMetrics"   
}

# Cloudwatch Alarm Variables
variable "cloudtrail_changes_alarm_name" {
  description = "Tha Name to be used for cloudwatch alarm"    
  default = "cloudtrail_changes"
}

variable "cloudtrail_changes_alarm_description" {
  description = "Tha Name to be used for cloudwatch alarm description"    
  default = "A CloudWatch Alarm that triggers when changes are made to CloudTrail."
}

variable "cloudtrail_changes_metric_name" {
  description = "The Name of the metric to be used in the cloudwatch alarm"    
  default = "CloudTrailEventCount"
}

variable "cloudtrail_changes_namespace" {
  description = "The Name of the namespace to be used in the cloudwatch alarm"    
  default = "CloudTrailMetrics"
}

# SNS Topic & Subscription Variables
variable "cloudtrail_changes_sns_display_name" {
  type        = string
  description = "Name shown in confirmation emails"
}

variable "cloudtrail_changes_sns_email_addresses" {
  type        = list(string)
  description = "Email address to send notifications to"
}

variable "cloudtrail_changes_sns_protocol" {
  default     = "email"
  description = "SNS Protocol to use. email or email-json"
  type        = string
}

variable "cloudtrail_changes_sns_stack_name" {
  type        = string
  description = "Unique Cloudformation stack name that wraps the SNS topic."
}


# AWS Config configuration changes Compliance Variables

# Cloudwatch Log Metric Variables
variable "aws_config_changes_log_group_name" {
  description = "The name of log group"    
}

variable "aws_config_changes_filter_pattern" {
  description = "The name of the filter pattern"  
  default = "{ ($.eventName = PutConfigurationRecorder) || ($.eventName = StopConfigurationRecorder) || ($.eventName = DeleteDeliveryChannel) || ($.eventName = PutDeliveryChannel) }"  
}

variable "aws_config_changes_event_name" {
  description = "The name of the event" 
  default = "CloudTrailEventCount"   
}

variable "aws_config_changes_metric_transformation_namespace" {
  description = "The name of the metric transformation"    
  default = "CloudTrailMetrics"
}

# Cloudwatch Alarm Variables
variable "aws_config_changes_alarm_name" {
  description = "Tha Name to be used for cloudwatch alarm"    
  default = "config_changes"
}

variable "aws_config_changes_alarm_description" {
  description = "Tha Name to be used for cloudwatch alarm description"    
  default = "A CloudWatch Alarm that triggers when changes are made to AWS Config."
}

variable "aws_config_changes_metric_name" {
  description = "The Name of the metric to be used in the cloudwatch alarm"    
  default = "CloudTrailEventCount"
}

variable "aws_config_changes_namespace" {
  description = "The Name of the namespace to be used in the cloudwatch alarm"    
  default = "CloudTrailMetrics"
}

# SNS Topic & Subscription Variables
variable "aws_config_changes_sns_display_name" {
  type        = string
  description = "Name shown in confirmation emails"
}

variable "aws_config_changes_sns_email_addresses" {
  type        = list(string)
  description = "Email address to send notifications to"
}

variable "aws_config_changes_sns_protocol" {
  default     = "email"
  description = "SNS Protocol to use. email or email-json"
  type        = string
}

variable "aws_config_changes_sns_stack_name" {
  type        = string
  description = "Unique Cloudformation stack name that wraps the SNS topic."
}


# Console Authentication failures Compliance Variables

# Cloudwatch Log Metric Variables
variable "authentication_failures_log_group_name" {
  description = "The name of log group"    
}

variable "authentication_failures_filter_pattern" {
  description = "The name of the filter pattern"    
  default = "{ ($.eventName = ConsoleLogin) && ($.errorMessage = \"Failed authentication\") }"
}

variable "authentication_failures_event_name" {
  description = "The name of the event"    
  default = "ConsoleLoginFailures"
}

variable "authentication_failures_metric_transformation_namespace" {
  description = "The name of the metric transformation"    
  default = "CloudTrailMetrics"
}

# Cloudwatch Alarm Variables
variable "authentication_failures_alarm_name" {
  description = "Tha Name to be used for cloudwatch alarm" 
  default = "failed_console_logins"   
}

variable "authentication_failures_alarm_description" {
  description = "Tha Name to be used for cloudwatch alarm description"    
  default = "A CloudWatch Alarm that triggers if there are AWS Management Console authentication failures."
}

variable "authentication_failures_metric_name" {
  description = "The Name of the metric to be used in the cloudwatch alarm"    
  default = "ConsoleLoginFailures"
}

variable "authentication_failures_namespace" {
  description = "The Name of the namespace to be used in the cloudwatch alarm"    
  default = "CloudTrailMetrics"
}

# SNS Topic & Subscription Variables
variable "authentication_failures_sns_display_name" {
  type        = string
  description = "Name shown in confirmation emails"
}

variable "authentication_failures_sns_email_addresses" {
  type        = list(string)
  description = "Email address to send notifications to"
}

variable "authentication_failures_sns_protocol" {
  default     = "email"
  description = "SNS Protocol to use. email or email-json"
  type        = string
}

variable "authentication_failures_sns_stack_name" {
  type        = string
  description = "Unique Cloudformation stack name that wraps the SNS topic."
}


# Root Account login Compliance Variables

# Cloudwatch Log Metric Variables
variable "root_login_log_group_name" {
  description = "The name of log group"    
}

variable "root_login_filter_pattern" {
  description = "The name of the filter pattern"    
  default = "{ ($.userIdentity.type = \"Root\") && ($.userIdentity.invokedBy NOT EXISTS) && ($.eventType != \"AwsServiceEvent\") }"
}

variable "root_login_event_name" {
  description = "The name of the event"    
  default = "RootUserEventCount"
}

variable "root_login_metric_transformation_namespace" {
  description = "The name of the metric transformation"    
  default = "CloudTrailMetrics"
}

# Cloudwatch Alarm Variables
variable "root_login_alarm_name" {
  description = "Tha Name to be used for cloudwatch alarm"    
  default = "root_account_login"
}

variable "root_login_alarm_description" {
  description = "Tha Name to be used for cloudwatch alarm description"    
  default = "A CloudWatch Alarm that triggers if a root user uses the account."
}

variable "root_login_metric_name" {
  description = "The Name of the metric to be used in the cloudwatch alarm"    
  default = "RootUserEventCount"
}

variable "root_login_namespace" {
  description = "The Name of the namespace to be used in the cloudwatch alarm"    
  default = "CloudTrailMetrics"
}

# SNS Topic & Subscription Variables
variable "root_login_sns_display_name" {
  type        = string
  description = "Name shown in confirmation emails"
}

variable "root_login_sns_email_addresses" {
  type        = list(string)
  description = "Email address to send notifications to"
}

variable "root_login_sns_protocol" {
  default     = "email"
  description = "SNS Protocol to use. email or email-json"
  type        = string
}

variable "root_login_sns_stack_name" {
  type        = string
  description = "Unique Cloudformation stack name that wraps the SNS topic."
}


# Unauthorized API Calls Compliance Variables

# Cloudwatch Log Metric Variables
variable "unauthorized_access_log_group_name" {
  description = "The name of log group"    
}

variable "unauthorized_access_filter_pattern" {
  description = "The name of the filter pattern"    
  default = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }"
}

variable "unauthorized_access_event_name" {
  description = "The name of the event"   
  default = "UnauthorizedAttemptCount" 
}

variable "unauthorized_access_metric_transformation_namespace" {
  description = "The name of the metric transformation"    
  default = "CloudTrailMetrics"
}

# Cloudwatch Alarm Variables
variable "unauthorized_access_alarm_name" {
  description = "Tha Name to be used for cloudwatch alarm"    
  default = "unauthorized_api_calls"
}

variable "unauthorized_access_alarm_description" {
  description = "The Name to be used for cloudwatch alarm description"    
  default     = "Cloudwatch alarm description"    
}

variable "unauthorized_access_metric_name" {
  description = "The Name of the metric to be used in the cloudwatch alarm"    
  default = "UnauthorizedAttemptCount"
}

variable "unauthorized_access_namespace" {
  description = "The Name of the namespace to be used in the cloudwatch alarm"    
  default = "CloudTrailMetrics"
}

# SNS Topic & Subscription Variables
variable "unauthorized_access_sns_display_name" {
  type        = string
  description = "Name shown in confirmation emails"
}

variable "unauthorized_access_sns_email_addresses" {
  type        = list(string)
  description = "Email address to send notifications to"
}

variable "unauthorized_access_sns_protocol" {
  default     = "email"
  description = "SNS Protocol to use. email or email-json"
  type        = string
}

variable "unauthorized_access_sns_stack_name" {
  type        = string
  description = "Unique Cloudformation stack name that wraps the SNS topic."
}