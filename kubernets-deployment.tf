#resource "kubernetes_deployment" "kubeginners-app" {
#  metadata {
#    name = "kubeginners-app-deployment"
#    labels = {
#      App = "kubeginners-app"
#    }
#  }
#
#  spec {
#    replicas = 2
#    selector {
#      match_labels = {
#        App = "kubeginners-app"
#      }
#    }
#    template {
#      metadata {
#        labels = {
#          App = "kubeginners-app"
#        }
#      }
#      spec {
#        container {
#          image = "hemanth0407/todo-app-kubeginners:v1"
#          name  = "app"
#
#          port {
#            container_port = 80
#          }
#
#        }
#      }
#    }
#  }
#}
#
