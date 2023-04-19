provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "docker-desktop"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  namespace  = kubernetes_namespace.jenkins_namespace.metadata[0].name

  values = [
    "${file("values.yaml")}",
  ]

  set {
    name  = "controller.serviceType"
    value = "LoadBalancer"
  }

  set {
    name  = "controller.adminPassword"
    value = "jenkins123" # Replace with a secure password
  }

  # set {
  #   name  = "controller.installPlugins"
  #   value = "simple-theme-plugin:0.6.0,workflow-job:2.41,workflow-aggregator:2.6,credentials-binding:1.27,git:4.10.0"
  # }
}

resource "kubernetes_namespace" "jenkins_namespace" {
  metadata {
    name = "jenkins"
  }
}
