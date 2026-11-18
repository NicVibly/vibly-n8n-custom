# vibly-n8n-custom

- `n8n/Dockerfile`: immagine di n8n usata dai servizi Primary e Worker su Railway (progetto vibly-n8n-worker). Versione fissata e nodi community installati nell'immagine.
- `Dockerfile` + `nginx.conf` (radice): vecchio servizio n8n-healthcheck.

## Aggiornare n8n
1. Cambia `N8N_VERSION` (e, se serve, le versioni dei nodi) in `n8n/Dockerfile`.
2. Prova in locale: `docker build -t vibly-n8n:test n8n/`, poi importa i workflow e controlla che nessun nodo manchi.
3. Push su `main`: Railway ricostruisce Primary e Worker insieme.
