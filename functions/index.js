const functions = require("firebase-functions");
const request = require("request");
const cors = require("cors")({origin: true});

exports.proxy = functions.https.onRequest((req, res) => {
  cors(req, res, () => {
    const imageUrl = req.query.url;
    if (!imageUrl) {
      res.status(400).send("URL is required");
      return;
    }

    request(imageUrl)
        .on("error", (err) => {
          console.error("Request error:", err);
          res.status(500).send("Failed to load image");
        })
        .pipe(res)
        .on("error", (err) => {
          console.error("Pipe error:", err);
          res.status(500).send("Failed to send image");
        });
  });
});
