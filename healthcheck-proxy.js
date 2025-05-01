const express = require('express');
const app = express();
const port = 3001;

app.get('/healthcheck', (req, res) => {
  const userAgent = req.headers['user-agent'] || '';

  // Controlla se la richiesta arriva da Uptime Kuma
  if (!userAgent.toLowerCase().includes('uptimekuma')) {
    return res.status(403).send('Forbidden');
  }

  // Altrimenti risponde OK
  res.status(200).send('OK');
});

app.listen(port, () => {
  console.log(`Healthcheck proxy listening on port ${port}`);
});
