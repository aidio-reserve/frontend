const express = require('express');
const request = require('request');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

// CORSを有効にする
app.use(cors());

app.get('/proxy', (req, res) => {
  const imageUrl = req.query.url;
  if (!imageUrl) {
    res.status(400).send('URL is required');
    return;
  }

  request(imageUrl)
    .on('error', (err) => {
      console.error('Request error:', err);
      res.status(500).send('Failed to load image');
    })
    .pipe(res)
    .on('error', (err) => {
      console.error('Pipe error:', err);
      res.status(500).send('Failed to send image');
    });
});

app.listen(PORT, () => {
  console.log(`Proxy server is running on port ${PORT}`);
});