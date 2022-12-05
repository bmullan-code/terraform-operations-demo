resource "kubernetes_service" "cloud-trace-demo-b" {
  metadata {
    name = "cloud-trace-demo-b"
  }
  spec {
    selector = {
      App = kubernetes_deployment.cloud-trace-demo-b.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 8090
      target_port = 8090
    }

    type = "ClusterIP"
  }
}