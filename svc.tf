resource "kubernetes_service" "jenkins" {
  metadata {
    name      = "jenkins"
    namespace = kubernetes_namespace.tools.id
  }
  spec {
    selector = {
      name = kubernetes_pod.jenkins.metadata.0.labels.name
    }
    port {
      port        = 81
      target_port = 8080
    }

    type = "NodePort"
  }
}

resource "kubernetes_service" "nexus" {
  metadata {
    name      = "nexus"
    namespace = kubernetes_namespace.tools.id
  }
  spec {
    selector = {
      name = kubernetes_pod.nexus.metadata.0.labels.name
    }
    port {
      port        = 82
      target_port = 8081
    }

    type = "NodePort"
  }
}

resource "kubernetes_service" "app" {
  metadata {
    name      = "app"
    namespace = kubernetes_namespace.dev.id
  }
  spec {
    selector = {
      name = kubernetes_pod.nexus.metadata.0.labels.name
    }
    port {
      port        = 83
      target_port = 80
    }

    type = "NodePort"
  }
}

resource "kubernetes_service" "mysql" {
  metadata {
    name      = "mysql"
    namespace = kubernetes_namespace.dev.id
  }
  spec {
    selector = {
      name = kubernetes_pod.nexus.metadata.0.labels.name
    }
    port {
      port        = 84
      target_port = 3306
    }

    type = "NodePort"
  }
}
