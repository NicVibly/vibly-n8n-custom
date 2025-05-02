FROM node:18-bullseye-slim

# Installa supervisor e nginx
RUN apt-get update && apt-get install -y supervisor nginx

# Installa N8N globalmente
RUN npm install -g n8n

# Copia la configurazione di nginx
COPY nginx.conf /nginx.conf

# Copia la configurazione di supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Espone la porta di N8N e quella del healthcheck
EXPOSE 5678 3001

CMD ["/usr/bin/supervisord"]
