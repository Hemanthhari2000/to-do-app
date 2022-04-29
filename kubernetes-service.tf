#resource "kubernetes_service" "kubeginners-app" {
#  metadata {
#    name = "kubeginners-app-svc"
#  }
#  spec {
#    selector = {
#      App = "kubeginners-app"
#    }
#    port {
#      port        = 80
#      target_port = 80
#    }
#
#    type = "LoadBalancer"
#  }
#}