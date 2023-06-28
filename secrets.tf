resource "kubernetes_secret" "db-sec" {
  metadata {
    name = "db-sec"
  }

  data = {
    username = "sarona"
    password = "sarona"
  }
}