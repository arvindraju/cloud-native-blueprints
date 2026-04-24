#!/bin/bash
# 1. Install ArgoCD Engine
kubectl create namespace argocd || true
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# 2. Wait for it to be ready
echo "Waiting for ArgoCD to start..."
kubectl wait --for=condition=available --timeout=600s deployment/argocd-server -n argocd

# 3. Apply the Root App (Points to your Git Repo)
kubectl apply -f bootstrap/argocd/root-app.yaml

echo "ArgoCD is now tracking your Git Repo!"
