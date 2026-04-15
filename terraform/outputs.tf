# ============================================================
# OUTPUTS TERRAFORM — TechAssist SAS
# Affiche les informations importantes après le déploiement
# ============================================================

# Adresse IP publique du serveur (pour s'y connecter en SSH)
output "server_public_ip" {
  description = "Adresse IP publique de l'instance EC2"
  value       = aws_instance.techassist_server.public_ip
}

# Nom DNS public du serveur
output "server_public_dns" {
  description = "Nom DNS public de l'instance EC2"
  value       = aws_instance.techassist_server.public_dns
}

# ID de l'instance EC2
output "instance_id" {
  description = "Identifiant unique de l'instance EC2"
  value       = aws_instance.techassist_server.id
}

# Nom du bucket S3 de sauvegardes
output "backup_bucket_name" {
  description = "Nom du bucket S3 pour les sauvegardes"
  value       = aws_s3_bucket.techassist_backups.bucket
}

# Message de fin de déploiement
output "deploy_message" {
  description = "Instructions de connexion après déploiement"
  value       = "Connexion SSH : ssh -i devops-key.pem ubuntu@${aws_instance.techassist_server.public_ip}"
}