resource "kubernetes_service" "cloud-trace-demo-c" {
  metadata {
    name = "cloud-trace-demo-c"
  }
  spec {
    selector = {
      App = kubernetes_deployment.cloud-trace-demo-c.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 8090
      target_port = 8090
    }

    type = "ClusterIP"
  }
}