# Immagine n8n di Vibly: versione fissata + nodi community già installati.
# Usata da Primary e Worker su Railway. Per aggiornare: cambia N8N_VERSION, prova in locale, poi push.
ARG N8N_VERSION=2.48.4
FROM n8nio/n8n:${N8N_VERSION}

USER node
# I nodi community stanno nell'immagine, non nel disco del container: un redeploy non li perde
# e il Worker ha gli stessi nodi del Primary.
RUN mkdir -p /home/node/.n8n/nodes \
 && cd /home/node/.n8n/nodes \
 && npm init -y >/dev/null \
 && npm install --omit=dev --legacy-peer-deps --ignore-scripts --no-audit --no-fund \
      @respond-io/n8n-nodes-respond-io@1.15.0 \
      n8n-nodes-tallyforms@1.3.3
