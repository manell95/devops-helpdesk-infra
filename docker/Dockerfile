# ============================================================
# DOCKERFILE — TechAssist SAS
# Auteur : Nick Manell LOUOCDOM KAMDEM
# Image de base pour la plateforme de ticketing Zammad
# ============================================================

FROM ghcr.io/zammad/zammad:latest

LABEL maintainer="Nick Manell LOUOCDOM KAMDEM"
LABEL project="TechAssist SAS - DevOps Helpdesk"
LABEL version="1.0"

ENV RAILS_ENV=production

EXPOSE 3000

CMD ["/opt/zammad/bin/docker-entrypoint.sh"]
