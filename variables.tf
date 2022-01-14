variable "project_name" {
  type = string
}

variable "location" {
  type = string
}

variable "spark_cluster" {
  type = object({
    workers_count = number
    node_size     = string
    username      = string
    password      = string
  })
}