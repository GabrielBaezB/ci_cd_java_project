provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Construcción de la imagen Docker
resource "docker_image" "app_image" {
  name = "ci_cd_java_project"
  build {
    context = "../"
  }
}

# Creación del contenedor Docker
resource "docker_container" "app_container" {
  name  = "ci_cd_java_project_container"
  image = docker_image.app_image.latest
  ports {
    internal = 8080
    external = 8080
  }
}
