resource "kubernetes_deployment" "cloud-trace-demo-a" {

  metadata {
    name = "cloud-trace-demo-a"
    labels = {
      App = "cloud-trace-demo-app-a"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = "cloud-trace-demo-app-a"
      }
    }

    template {
      metadata {
        labels = {
          App = "cloud-trace-demo-app-a"
        }
      }
      spec {
        container {
          name  = "cloud-trace-demo-container"
          image = "barrymullan/cloud-trace-demo-opentelemetry:latest"
          # imagePullPolicy: "Always"

          port {
            container_port = 8080
          }

          command = ["python"]
          args    = ["app.py"]
          env {
            name  = "PORT"
            value = "8080"
          }
          env {
            name  = "KEYWORD"
            value = "Hello, I am service A"
          }
          env {
            name  = "ENDPOINT"
            value = "http://cloud-trace-demo-b:8090"
          }
        }
      }
    }
  }
}