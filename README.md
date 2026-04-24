# 🚀 Cloud-Native IDP Platform (Blueprints)

This repository serves as the **Control Plane** for my personal IDP. It contains the infrastructure blueprints (XRDs/Compositions) and the bootstrap logic for a GitOps-driven environment.

## 🏗️ Architecture Overview
- **Portal:** Backstage (Containerized)
- **Control Plane:** Crossplane (Native Azure Provider)
- **GitOps Engine:** ArgoCD (Self-managed)
- **AI Orchestrator:** Google Gemini (via Backstage Scaffolder)

## 📂 Repository Structure
- `/bootstrap/argocd`: Root ArgoCD Application (Self-healing).
- `/bootstrap/apps`: Manifests for platform components (Crossplane, Backstage).
- `/blueprints`: Custom Crossplane XRDs and Compositions.
- `bootstrap.sh`: The "one-click" recovery script for empirical VMs.

---

## ⚡ Quick Start (New VM Setup)

If starting on a fresh Ubuntu VM with Kubernetes pre-installed:

1. **Clone the Repo:**
   ```bash
   git clone [https://github.com/YOUR_GITHUB_USERNAME/cloud-native-blueprints.git](https://github.com/YOUR_GITHUB_USERNAME/cloud-native-blueprints.git)
   cd cloud-native-blueprints

2. **Execute Bootstrap:**
   chmod +x bootstrap.sh
   ./bootstrap.sh

3. **Post-Installation (Manual Secrets)**:
   Since we don't store secrets in Git, apply your Azure credentials:
   kubectl create secret generic azure-secret -n crossplane-system --from-file=creds=./azure-credentials.json

**🛠️ Operational Commands**

**Access ArgoCD UI**

** 1. Get Admin Password:**

    kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
    
** 2. Port Forward:**

    kubectl port-forward svc/argocd-server -n argocd 8080:443

  
    


