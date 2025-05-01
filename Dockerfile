FROM node:18-bullseye-slim

# Installa dipendenze necessarie
RUN apt-get update && apt-get install -y curl gnupg supervisor

# Installa N8N
RUN npm install -g n8n

# Copia i file custom
COPY healthcheck-proxy.js /healthcheck-proxy.js
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Installa dipendenze del proxy
RUN npm install express

# Espone le porte
EXPOSE 5678 3001

CMD ["/usr/bin/supervisord"]
