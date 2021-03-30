variable "ingress_class" {
  type        = string
  description = "Specifies which ingress class should be used. Defaults to the default cluster class"
  default     = null
}
variable "ratelimit_average" {
  type        = number
  description = "`ratelimit_average` is the maximum rate, by default in requests per second, allowed from a given source. Defaults to `0`"
  default     = 0
}
variable "ratelimit_period" {
  type        = number
  description = "`ratelimit_period`, in combination with `ratelimit_average`, defines the actual maximum rate. Defaults to `1` second"
  default     = 1
}
variable "ratelimit_burst" {
  type        = number
  description = "`ratelimit_burst` is the maximum number of requests allowed to go through in the same arbitrarily small period of time. Defaults to `1`"
  default     = 1
}

variable "apiserver_url" {
  type        = string
  description = ""
}
variable "apiserver_service_name" {
  type        = string
  description = ""
  default     = "kubernetes"
}
variable "apiserver_service_namespace" {
  type        = string
  description = ""
  default     = "default"
}
variable "cluster_cert_issuer" {
  type        = string
  description = ""
}
variable "labels" {
  type        = map(string)
  description = ""
}