resource "kubernetes_secret" "db-sec" {
  metadata {
    name = "db-sec"
    namespace = "dev"
  }

  data = {
    username = "sarona"
    MYSQL_ROOT_PASSWORD = "sarona"
  }
}