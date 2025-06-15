# terraform/main.tf
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "mlops" {
  name         = "mlops-api"
  build {
    context    = "../"
  }
}

resource "docker_container" "mlops_container" {
  name  = "mlops-api"
  image = docker_image.mlops.latest
  ports {
    internal = 5000
    external = 5000
  }
}
