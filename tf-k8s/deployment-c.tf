resource "kubernetes_deployment" "cloud-trace-demo-c" {

  metadata {
    name = "cloud-trace-demo-c"
    labels = {
      App = "cloud-trace-demo-app-c"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = "cloud-trace-demo-app-c"
      }
    }

    template {
      metadata {
        labels = {
          App = "cloud-trace-demo-app-c"
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
            value = "Hello, I am service C"
          }
        }
      }
    }
  }
}