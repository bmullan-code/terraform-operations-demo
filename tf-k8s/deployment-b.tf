resource "kubernetes_deployment" "cloud-trace-demo-b" {

  metadata {
    name = "cloud-trace-demo-b"
    labels = {
      App = "cloud-trace-demo-app-b"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = "cloud-trace-demo-app-b"
      }
    }

    template {
      metadata {
        labels = {
          App = "cloud-trace-demo-app-b"
        }
      }
      spec {
        container {
          name  = "cloud-trace-demo-container"
          image = "barrymullan/cloud-trace-demo-opentelemetry:latest"
          # imagePullPolicy: "Always"

          port {
            container_port = 8090
          }

          command = ["python"]
          args    = ["app.py"]
          env {
            name  = "PORT"
            value = "8090"
          }
          env {
            name  = "KEYWORD"
            value = "Hello, I am service B"
          }
          env {
            name  = "ENDPOINT"
            value = "http://cloud-trace-demo-c:8090"
          }
        }
      }
    }
  }
}