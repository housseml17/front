# Utilisation d'une image Node.js comme base
FROM node:latest as build

# Installer Angular CLI
RUN npm install -g @angular/cli

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier tout le contenu de votre application Angular dans le conteneur
COPY . .

# Construire l'application Angular
RUN ng build --prod

# Utilisation d'une image nginx pour servir l'application Angular
FROM nginx:latest

# Copier les fichiers de l'application construite dans le serveur nginx
COPY --from=build /app/dist/* /usr/share/nginx/html/

# Exposer le port 80
EXPOSE 80

# Commande pour démarrer nginx
CMD ["nginx", "-g", "daemon off;"]
