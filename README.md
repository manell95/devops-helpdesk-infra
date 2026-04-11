# 🚀 DevOps HelpDesk Infrastructure — TechAssist SAS

## 📌 Contexte du projet

**TechAssist SAS** est une PME française de 60 collaborateurs basée en ile de france a paris ,
spécialisée dans le conseil IT pour des clients du secteur bancaire et retail.

### 🔴 Problème identifié

L'équipe IT de 8 personnes reçoit les demandes de support via email, 
WhatsApp et téléphone.  
Aucun système centralisé n'existe pour tracer, prioriser et résoudre les incidents.

**Conséquences :**
- Perte de temps considérable pour l'équipe technique
- Incidents non tracés et non résolus
- Insatisfaction des collaborateurs
- Aucune visibilité sur les métriques de performance IT

### ✅ Ma mission

En tant qu'Administrateur Système DevOps, je suis missionné pour :
- Concevoir et déployer une infrastructure cloud automatisée sur AWS
- Héberger une plateforme de ticketing IT 
- Automatiser les déploiements via un pipeline CI/CD (GitHub Actions)
- Conteneuriser l'application avec Docker et Kubernetes
- Sécuriser l'ensemble de l'infrastructure
- Mettre en place une supervision complète (Prometheus + Grafana)

---

## 🏗️ Stack technique

| Domaine | Technologie |
|---|---|
| Cloud | AWS (EC2, S3, RDS, VPC) |
| IaC | Terraform |
| Configuration | Ansible |
| Conteneurisation | Docker + Kubernetes (K3s) |
| CI/CD | GitHub Actions |
| Application | Zammad (helpdesk open source) |
| Sécurité | SSL Let's Encrypt + AWS Security Groups |
| Supervision | Prometheus + Grafana + Alertmanager |
| Stockage | AWS S3 (backups) |

---

## 📁 Structure du projet

devops-helpdesk-infra/
├── terraform/          # Infrastructure as Code AWS
├── ansible/            # Configuration des serveurs
├── docker/             # Conteneurisation de l'application
├── kubernetes/         # Manifests Kubernetes
├── monitoring/         # Prometheus + Grafana
├── .github/workflows/  # Pipelines CI/CD
└── docs/               # Documentation et schémas

---

## 👤 Auteur

**Nick Manell LOUOCDOM KAMDEM**  
Certification : TP-01414 Administrateur Système DevOps — RNCP36061  
Organisme : Liora (ex DataScientest)  
Année : 2026
