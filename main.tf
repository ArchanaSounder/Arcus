# CloudTrail logs delivery failures to S3Bucket Compliance

# Cloudwatch Log Metric Creation
module "cloudtrail_log_delivery_failure_cw_log_metric_creation" {
  source                           = "./Modules/Cloudwatch_Metric"
  profile                          = var.profile
  region                           = var.region  
  log_group_name                   = var.cloudtrail_log_delivery_failure_log_group_name
  filter_pattern                   = var.cloudtrail_log_delivery_failure_filter_pattern
  event_name                       = var.cloudtrail_log_delivery_failure_event_name
  metric_transformation_namespace  = var.cloudtrail_log_delivery_failure_metric_transformation_namespace
}

# Cloudwatch Alarm Creation
module "cloudtrail_log_delivery_failure_cw_alarm_creation" {
  source                           = "./Modules/Cloudwatch_Alarm"
  profile                          = var.profile
  region                           = var.region  
  alarm_name                       = var.cloudtrail_log_delivery_failure_alarm_name
  alarm_description                = var.cloudtrail_log_delivery_failure_alarm_description
  metric_name                      = var.cloudtrail_log_delivery_failure_metric_name
  namespace                        = var.cloudtrail_log_delivery_failure_namespace
  alarm_actions                    = module.cloudtrail_log_delivery_failure_sns_topic_subscription_creation.arn
}

# SNS Topic & Subscription
module "cloudtrail_log_delivery_failure_sns_topic_subscription_creation" {
  source                           = "./Modules/SNS_With_Subscription"
  profile                          = var.profile
  region                           = var.region  
  sns_display_name                 = var.cloudtrail_log_delivery_failure_sns_display_name
  sns_email_addresses              = var.cloudtrail_log_delivery_failure_sns_email_addresses
  sns_protocol                     = var.cloudtrail_log_delivery_failure_sns_protocol
  sns_stack_name                   = var.cloudtrail_log_delivery_failure_sns_stack_name  
}

# VPC Changes Compliance

# Cloudwatch Log Metric Creation
module "vpc_changes_cw_log_metric_creation" {
  source                           = "./Modules/Cloudwatch_Metric"
  profile                          = var.profile
  region                           = var.region  
  log_group_name                   = var.vpc_changes_log_group_name
  filter_pattern                   = var.vpc_changes_filter_pattern
  event_name                       = var.vpc_changes_event_name
  metric_transformation_namespace  = var.vpc_changes_metric_transformation_namespace
}

# Cloudwatch Alarm Creation
module "vpc_changes_cw_alarm_creation" {
  source                          = "./Modules/Cloudwatch_Alarm"
  profile                         = var.profile
  region                          = var.region  
  alarm_name                      = var.vpc_changes_alarm_name
  alarm_description               = var.vpc_changes_alarm_description
  metric_name                     = var.vpc_changes_metric_name
  namespace                       = var.vpc_changes_namespace
  alarm_actions                   = module.vpc_changes_sns_topic_subscription_creation.arn
}

# SNS Topic & Subscription
module "vpc_changes_sns_topic_subscription_creation" {
  source                          = "./Modules/SNS_With_Subscription"
  profile                         = var.profile
  region                          = var.region  
  sns_display_name                = var.vpc_changes_sns_display_name
  sns_email_addresses             = var.vpc_changes_sns_email_addresses
  sns_protocol                    = var.vpc_changes_sns_protocol
  sns_stack_name                  = var.vpc_changes_sns_stack_name 
}

# CMKS Changes Compliance

# Cloudwatch Log Metric Creation
module "cmks_changes_cw_log_metric_creation" {
  source                          = "./Modules/Cloudwatch_Metric"
  profile                         = var.profile
  region                          = var.region  
  log_group_name                  = var.cmks_changes_log_group_name
  filter_pattern                  = var.cmks_changes_filter_pattern
  event_name                      = var.cmks_changes_event_name
  metric_transformation_namespace = var.cmks_changes_metric_transformation_namespace
}


# Cloudwatch Alarm Creation
module "cmks_changes_cw_alarm_creation" {
  source                         = "./Modules/Cloudwatch_Alarm"
  profile                        = var.profile
  region                         = var.region  
  alarm_name                     = var.cmks_changes_alarm_name
  alarm_description              = var.cmks_changes_alarm_description
  metric_name                    = var.cmks_changes_metric_name
  namespace                      = var.cmks_changes_namespace
  alarm_actions                  = module.cmks_changes_sns_topic_subscription_creation.arn
}

# SNS Topic & Subscription
module "cmks_changes_sns_topic_subscription_creation" {
  source                         = "./Modules/SNS_With_Subscription"
  profile                        = var.profile
  region                         = var.region  
  sns_display_name               = var.cmks_changes_sns_display_name
  sns_email_addresses            = var.cmks_changes_sns_email_addresses
  sns_protocol                   = var.cmks_changes_sns_protocol
  sns_stack_name                 = var.cmks_changes_sns_stack_name 
}



# IAM Policy Changes Compliance

# Cloudwatch Event Rule Creation
module "iam_policy_changes_cw_event_rule_creation" {
  source                        = "./Modules/Cloudwatch_Event_rule/Event_rule"
  profile                       = var.profile
  region                        = var.region  
  event_rule_name               = var.iam_policy_changes_event_rule_name
}


# SNS Topic & Subscription
module "iam_policy_changes_sns_topic_subscription_creation" {
  source                        = "./Modules/SNS_With_Subscription"
  profile                       = var.profile
  region                        = var.region  
  sns_display_name              = var.iam_policy_changes_sns_display_name
  sns_email_addresses           = var.iam_policy_changes_sns_email_addresses
  sns_protocol                  = var.iam_policy_changes_sns_protocol
  sns_stack_name                = var.iam_policy_changes_sns_stack_name
}


# IAM Policy Association with SNS Topic
module "iam_policy_changes_iam_policy_association_with_sns" {
  source                      = "./Modules/SNS_IAM_Policy"
  profile                     = var.profile
  region                      = var.region
  sns_topic_arn               = module.iam_policy_changes_sns_topic_subscription_creation.arn
}


# Cloudwatch Target For Event Rule Creation
module "iam_policy_changes_cw_tg_event_rule_creation" {
  source                      = "./Modules/Cloudwatch_Event_rule/TargetForEventRule"
  profile                     = var.profile
  region                      = var.region
  event_rule_name             = var.iam_policy_changes_cw_tg_event_rule_event_rule_name
  sns_topic_arn               = module.iam_policy_changes_sns_topic_subscription_creation.arn
}


# Management Console sign-in without MFA Compliance

# Cloudwatch Log Metric Creation
module "sign_in_without_mfa_cw_log_metric_creation" {
  source                           = "./Modules/Cloudwatch_Metric"
  profile                          = var.profile
  region                           = var.region  
  log_group_name                   = var.sign_in_without_mfa_log_group_name
  filter_pattern                   = var.sign_in_without_mfa_filter_pattern
  event_name                       = var.sign_in_without_mfa_event_name
  metric_transformation_namespace  = var.sign_in_without_mfa_metric_transformation_namespace
}


# Cloudwatch Alarm Creation
module "sign_in_without_mfa_cw_alarm_creation" {
  source                           = "./Modules/Cloudwatch_Alarm"
  profile                          = var.profile
  region                           = var.region  
  alarm_name                       = var.sign_in_without_mfa_alarm_name
  alarm_description                = var.sign_in_without_mfa_alarm_description
  metric_name                      = var.sign_in_without_mfa_metric_name
  namespace                        = var.sign_in_without_mfa_namespace
  alarm_actions                    = module.sign_in_without_mfa_sns_topic_subscription_creation.arn
}

# SNS Topic & Subscription
module "sign_in_without_mfa_sns_topic_subscription_creation" {
  source                           = "./Modules/SNS_With_Subscription"
  profile                          = var.profile
  region                           = var.region  
  sns_display_name                 = var.sign_in_without_mfa_sns_display_name
  sns_email_addresses              = var.sign_in_without_mfa_sns_email_addresses
  sns_protocol                     = var.sign_in_without_mfa_sns_protocol
  sns_stack_name                   = var.sign_in_without_mfa_sns_stack_name
}



# Network Gateways Changes Compliance

# Cloudwatch Log Metric Creation
module "network_gw_changes_cw_log_metric_creation" {
  source                           = "./Modules/Cloudwatch_Metric"
  profile                          = var.profile
  region                           = var.region  
  log_group_name                   = var.network_gw_changes_log_group_name
  filter_pattern                   = var.network_gw_changes_filter_pattern
  event_name                       = var.network_gw_changes_event_name
  metric_transformation_namespace  = var.network_gw_changes_metric_transformation_namespace
}
# Cloudwatch Alarm Creation
module "network_gw_changes_cw_alarm_creation" {
  source                           = "./Modules/Cloudwatch_Alarm"
  profile                          = var.profile
  region                           = var.region  
  alarm_name                       = var.network_gw_changes_alarm_name
  alarm_description                = var.network_gw_changes_alarm_description
  metric_name                      = var.network_gw_changes_metric_name
  namespace                        = var.network_gw_changes_namespace
  alarm_actions                    = module.network_gw_changes__sns_topic_subscription_creation.arn
}

# SNS Topic & Subscription
module "network_gw_changes__sns_topic_subscription_creation" {
  source                           = "./Modules/SNS_With_Subscription"
  profile                          = var.profile
  region                           = var.region  
  sns_display_name                 = var.network_gw_changes_sns_display_name
  sns_email_addresses              = var.network_gw_changes_sns_email_addresses
  sns_protocol                     = var.network_gw_changes_sns_protocol
  sns_stack_name                   = var.network_gw_changes_sns_stack_name
}


# CloudTrail Configuration Changes Compliance

# Cloudwatch Log Metric Creation
module "cloudtrail_changes_cw_log_metric_creation" {
  source                           = "./Modules/Cloudwatch_Metric"
  profile                          = var.profile
  region                           = var.region  
  log_group_name                   = var.cloudtrail_changes_log_group_name
  filter_pattern                   = var.cloudtrail_changes_filter_pattern
  event_name                       = var.cloudtrail_changes_event_name
  metric_transformation_namespace  = var.cloudtrail_changes_metric_transformation_namespace
}

# Cloudwatch Alarm Creation
module "cloudtrail_changes_cw_alarm_creation" {
  source                            = "./Modules/Cloudwatch_Alarm"
  profile                           = var.profile
  region                            = var.region  
  alarm_name                        = var.cloudtrail_changes_alarm_name
  alarm_description                 = var.cloudtrail_changes_alarm_description
  metric_name                       = var.cloudtrail_changes_metric_name
  namespace                         = var.cloudtrail_changes_namespace
  alarm_actions                     = module.cloudtrail_changes_sns_topic_subscription_creation.arn
}

# SNS Topic & Subscription
module "cloudtrail_changes_sns_topic_subscription_creation" {
  source                           = "./Modules/SNS_With_Subscription"
  profile                          = var.profile
  region                           = var.region  
  sns_display_name                 = var.cloudtrail_changes_sns_display_name
  sns_email_addresses              = var.cloudtrail_changes_sns_email_addresses
  sns_protocol                     = var.cloudtrail_changes_sns_protocol
  sns_stack_name                   = var.cloudtrail_changes_sns_stack_name
}

# AWS Config configuration changes Compliance

# Cloudwatch Log Metric Creation
module "aws_config_changes_cw_log_metric_creation" {
  source                          = "./Modules/Cloudwatch_Metric"
  profile                         = var.profile
  region                          = var.region  
  log_group_name                  = var.aws_config_changes_log_group_name
  filter_pattern                  = var.aws_config_changes_filter_pattern
  event_name                      = var.aws_config_changes_event_name
  metric_transformation_namespace = var.aws_config_changes_metric_transformation_namespace
}

# Cloudwatch Alarm Creation
module "aws_config_changes_cw_alarm_creation" {
  source                          = "./Modules/Cloudwatch_Alarm"
  profile                         = var.profile
  region                          = var.region  
  alarm_name                      = var.aws_config_changes_alarm_name
  alarm_description               = var.aws_config_changes_alarm_description
  metric_name                     = var.aws_config_changes_metric_name
  namespace                       = var.aws_config_changes_namespace
  alarm_actions                   = module.aws_config_changes_sns_topic_subscription_creation.arn
}

# SNS Topic & Subscription
module "aws_config_changes_sns_topic_subscription_creation" {
  source                          = "./Modules/SNS_With_Subscription"
  profile                         = var.profile
  region                          = var.region  
  sns_display_name                = var.aws_config_changes_sns_display_name
  sns_email_addresses             = var.aws_config_changes_sns_email_addresses
  sns_protocol                    = var.aws_config_changes_sns_protocol
  sns_stack_name                  = var.aws_config_changes_sns_stack_name
}


# Console Authentication failures Compliance

# Cloudwatch Log Metric Creation
module "authentication_failures_cw_log_metric_creation" {
  source                          = "./Modules/Cloudwatch_Metric"
  profile                         = var.profile
  region                          = var.region  
  log_group_name                  = var.authentication_failures_log_group_name
  filter_pattern                  = var.authentication_failures_filter_pattern
  event_name                      = var.authentication_failures_event_name
  metric_transformation_namespace = var.authentication_failures_metric_transformation_namespace
}

# Cloudwatch Alarm Creation
module "authentication_failures_cw_alarm_creation" {
  source                          = "./Modules/Cloudwatch_Alarm"
  profile                         = var.profile
  region                          = var.region  
  alarm_name                      = var.authentication_failures_alarm_name
  alarm_description               = var.authentication_failures_alarm_description
  metric_name                     = var.authentication_failures_metric_name
  namespace                       = var.authentication_failures_namespace
  alarm_actions                   = module.authentication_failures_sns_topic_subscription_creation.arn
}

# SNS Topic & Subscription
module "authentication_failures_sns_topic_subscription_creation" {
  source                         = "./Modules/SNS_With_Subscription"
  profile                        = var.profile
  region                         = var.region  
  sns_display_name               = var.authentication_failures_sns_display_name
  sns_email_addresses            = var.authentication_failures_sns_email_addresses
  sns_protocol                   = var.authentication_failures_sns_protocol
  sns_stack_name                 = var.authentication_failures_sns_stack_name
}

# Root Account login Compliance

# Cloudwatch Log Metric Creation
module "root_login_cw_log_metric_creation" {
  source                          = "./Modules/Cloudwatch_Metric"
  profile                         = var.profile
  region                          = var.region  
  log_group_name                  = var.root_login_log_group_name
  filter_pattern                  = var.root_login_filter_pattern
  event_name                      = var.root_login_event_name
  metric_transformation_namespace = var.root_login_metric_transformation_namespace
}
# Cloudwatch Alarm Creation
module "root_login_cw_alarm_creation" {
  source                         = "./Modules/Cloudwatch_Alarm"
  profile                        = var.profile
  region                         = var.region  
  alarm_name                     = var.root_login_alarm_name
  alarm_description              = var.root_login_alarm_description
  metric_name                    = var.root_login_metric_name
  namespace                      = var.root_login_namespace
  alarm_actions                  = module.root_login_sns_topic_subscription_creation.arn
}

# SNS Topic & Subscription
module "root_login_sns_topic_subscription_creation" {
  source                        = "./Modules/SNS_With_Subscription"
  profile                       = var.profile
  region                        = var.region  
  sns_display_name              = var.root_login_sns_display_name
  sns_email_addresses           = var.root_login_sns_email_addresses
  sns_protocol                  = var.root_login_sns_protocol
  sns_stack_name                = var.root_login_sns_stack_name
}

# Unauthorized API Calls Compliance

# Cloudwatch Log Metric Creation
module "unauthorized_access_cw_log_metric_creation" {
  source                          = "./Modules/Cloudwatch_Metric"
  profile                         = var.profile
  region                          = var.region  
  log_group_name                  = var.unauthorized_access_log_group_name
  filter_pattern                  = var.unauthorized_access_filter_pattern
  event_name                      = var.unauthorized_access_event_name
  metric_transformation_namespace = var.unauthorized_access_metric_transformation_namespace
}

# Cloudwatch Alarm Creation
module "unauthorized_access_cw_alarm_creation" {
  source                          = "./Modules/Cloudwatch_Alarm"
  profile                         = var.profile
  region                          = var.region  
  alarm_name                      = var.unauthorized_access_alarm_name
  alarm_description               = var.unauthorized_access_alarm_description
  metric_name                     = var.unauthorized_access_metric_name
  namespace                       = var.unauthorized_access_namespace
  alarm_actions                   = module.unauthorized_access_sns_topic_subscription_creation.arn
}

# SNS Topic & Subscription
module "unauthorized_access_sns_topic_subscription_creation" {
  source                          = "./Modules/SNS_With_Subscription"
  profile                         = var.profile
  region                          = var.region    
  sns_display_name                = var.unauthorized_access_sns_display_name
  sns_email_addresses             = var.unauthorized_access_sns_email_addresses
  sns_protocol                    = var.unauthorized_access_sns_protocol
  sns_stack_name                  = var.unauthorized_access_sns_stack_name              
}


