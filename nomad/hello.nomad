job "nginx" {
  datacenters = ["dc1"]

  group "web" {
    network {
      port "http" {
        to = 80
      }
    }

    task "nginx" {
      driver = "docker"

      config {
        image = "nginx:latest"
        ports = ["http"]
      }

      resources {
        cpu    = 100
        memory = 128
      }

      service {
        name = "nginx"
        port = "http"
        provider = "nomad"
        check {
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
