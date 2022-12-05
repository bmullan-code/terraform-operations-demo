resource "kubernetes_deployment" "cloud-trace-demo-client" {

  metadata {
    name = "cloud-trace-demo-client"
    labels = {
      App = "cloud-trace-demo-app-client"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = "cloud-trace-demo-app-client"
      }
    }

    template {
      metadata {
        labels = {
          App = "cloud-trace-demo-app-client"
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
          args    = ["client.py"]
          env {
            name  = "PORT"
            value = "8080"
          }
        }
      }
    }
  }
}