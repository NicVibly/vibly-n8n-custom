FROM node:18-bullseye-slim

# Installa dipendenze di sistema
RUN apt-get update && apt-get install -y curl gnupg supervisor

# Installa N8N globalmente
RUN npm install -g n8n

# Crea una cartella per il proxy healthcheck
WORKDIR /proxy

# Copia i file
COPY healthcheck-proxy.js .
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Inizializza npm e installa express
RUN npm init -y && npm install express

# Torna alla root
WORKDIR /

# Espone le porte
EXPOSE 5678 3001

CMD ["/usr/bin/supervisord"]
