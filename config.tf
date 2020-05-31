# configuring the docker provider 
provider "docker" {
  host = "tcp://192.168.99.108:2376/"
}

# create a container
resource "docker_image" "nginx" {
  name = "nginx:1.11-alpine"
}

resource "docker_container" "nginx-server" {
  name  = "nginx-server"
  image = "${docker_image.nginx.latest}"
  ports {
    internal = 80
    external = 80
  }
  volumes {
    container_path = "/usr/share/nginx/html/index.html"
    host_path      = "/c/Users/karigar/Desktop/terraform-nginx/index.html"
    #read_only      = false
  }
}