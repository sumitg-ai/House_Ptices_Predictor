output "container_name" {
  value = docker_container.mlops_api_container.name
  description = "Name of the running Docker container"
}

output "host_port" {
  value = docker_container.mlops_api_container.ports[0].external
  description = "Port exposed on localhost"
}

output "url" {
  value = "http://localhost:${docker_container.mlops_api_container.ports[0].external}/predict"
  description = "URL to access the MLOps API endpoint"
}
