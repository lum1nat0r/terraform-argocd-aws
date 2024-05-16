resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }

  depends_on = [ module.eks ]
}

resource "helm_release" "argocd" {
  name = "argocd"
  namespace = kubernetes_namespace.argocd.metadata.0.name

  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  version = "6.9.2"
  depends_on = [ kubernetes_namespace.argocd ]
  values = [ file("values/argocd.yaml") ]
}