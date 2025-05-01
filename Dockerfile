FROM n8nio/n8n

USER root

# Installa node + npm e supervisor
RUN apt-get update && apt-get install -y curl gnupg supervisor \
  && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get install -y nodejs

# Copia i file nel container
COPY healthcheck-proxy.js /healthcheck-proxy.js
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Installa le dipendenze per il proxy
RUN npm install express

# Espone la porta per N8N e per il proxy
EXPOSE 5678 3001

CMD ["/usr/bin/supervisord"]
