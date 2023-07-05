resource "kubernetes_pod" "jenkins" {
  metadata {
    name      = "jenkins"
    namespace = kubernetes_namespace.tools.id
    labels = {
      name = "jenkins"
    }
  }

  spec {
    container {
      image = "muhammedgamal/grad-4"
      name  = "jenkins"
      volume_mount {
        name      = "docker-socket"
        mount_path = "/var/run/docker.sock"
      }
    }

    volume {
      name = "docker-socket"

      host_path {
        path = "/var/run/docker.sock"
      }
    }
    }

  }


resource "kubernetes_pod" "nexus" {
  metadata {
    name      = "nexus"
    namespace = kubernetes_namespace.tools.id
    labels = {
      name = "nexus"
    }
  }

  spec {
    container {
      image = "sonatype/nexus3"
      name  = "nexus"
    }

  }
}

##########################################
##########################################
##########################################

resource "kubernetes_pod" "mysql" {
  metadata {
    name      = "mysql"
    namespace = kubernetes_namespace.dev.id
    labels = {
      name = "mysql"
    }
  }

  spec {
    container {
      image = "mysql"
      name  = "mysql"
      env_from {
        secret_ref {
          name = kubernetes_secret.db-sec.metadata.0.name
        }
      }
    }
  }
}




