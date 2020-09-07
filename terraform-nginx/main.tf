provider "kubernetes" {}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx"
    labels = {
      app = "nginx"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          image = "nginx"
          name  = "nginx"
        }
      }
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx"
  }
  spec {
    selector = {
      app = "nginx"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "ClusterIP"
  }
}

resource "kubernetes_ingress" "nginx" {
  metadata {
    name = "nginx"
    annotations = {
      "ingress.kubernetes.io/ssl-redirect" = "false"
    }
  }

  spec {
    rule {
      host = "nginx.localhost"
      http {
        path {
          backend {
            service_name = "nginx"
            service_port = 80
          }

          path = "/"
        }
      }
    }
  }
}
