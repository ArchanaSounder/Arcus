variable "profile" {
  description = "Name of AWS profile"
  default     = "default"
}

variable "region" {
  description = "Region to deploy AWS Resources in"
}

variable "alarm_name" {
description   = "Tha Name to be used for cloudwatch alarm"    
}

variable "alarm_description" {
description   = "Tha Name to be used for cloudwatch alarm description"    
}

variable "metric_name" {
description   = "The Name of the metric to be used in the cloudwatch alarm"    
}

variable "namespace" {
description   = "The Name of the namespace to be used in the cloudwatch alarm"    
}

variable "alarm_actions" {
description  = "The Action of the cloudwatch alarm"    
}
