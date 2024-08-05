const functions = require("firebase-functions");
const axios = require("axios");
const cors = require("cors")({origin: true});

exports.proxy = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    const imageUrl = req.query.url;
    if (!imageUrl) {
      res.status(400).send("URL is required");
      return;
    }

    try {
      const response = await axios.get(imageUrl, {responseType: "stream"});
      res.setHeader("Access-Control-Allow-Origin", "*");
      response.data.pipe(res);
    } catch (err) {
      console.error("Request error:", err);
      res.status(500).send("Failed to load image");
    }
  });
});
