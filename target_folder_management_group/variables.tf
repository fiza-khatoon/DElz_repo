variable "level1_name" {
  type        = string
  description = "Name for the first level management group"
}

variable "level1_display_name" {
  type        = string
  description = "Friendly name for the first level management group. If not specified, this will be the same as the name"
}

variable "level1_subscription_ids" {
  type        = list(string)
  description = "A list of subscription GUIDs which should be assigned to the first level management group"
  default     = []
}

variable "level2_name" {
  type        = string
  description = "Name for the second level management group"
}

variable "level2_display_name" {
  type        = string
  description = "Friendly name for the second level management group. If not specified, this will be the same as the name"
}

variable "level2_subscription_ids" {
  type        = list(string)
  description = "A list of subscription GUIDs which should be assigned to the second level management group"
  default     = []
}

variable "parent_management_group_id" {
  type        = string
  description = "The ID of the parent management group"
}

#