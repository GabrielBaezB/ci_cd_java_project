terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_container" "app_container" {
  name  = "ci_cd_java_project_container"
  image = docker_image.app_image.latest
  ports {
    internal = 8080
    external = 8080
  }
}
