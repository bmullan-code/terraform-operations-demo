resource "kubernetes_service" "cloud-trace-demo-a" {
  metadata {
    name = "cloud-trace-demo-a"
  }
  spec {
    selector = {
      App = kubernetes_deployment.cloud-trace-demo-a.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}