# Utiliser l'image Fedora 39 comme base
FROM fedora:39

# Installer les dépendances nécessaires
RUN dnf -y update && \
    dnf -y install geoclue2-demos nodejs && \
    dnf clean all

# Créer un répertoire pour l'application
WORKDIR /app

# Copier les fichiers de l'application dans le conteneur
COPY . /app

# Rendre le script exécutable
RUN chmod +x run.mjs

# Exposer le port si nécessaire (à modifier selon les besoins de l'application)
EXPOSE 3000

# Commande par défaut pour lancer l'application
CMD ["./run.mjs", "--city", "montreal"]
