const express = require("express");
const axios = require("axios");
const nodeEnv = process.env.NODE_ENV || "development";

const app = express();

app.get("/hello-world", (req, res) => {
  axios
    .get(
      `http://${
        nodeEnv === "production" ? "third-container" : "127.0.0.1"
      }:3000/user`
    )
    .then((response) => {
      res.send("Hello, " + response.data.name);
    })
    .catch((error) => {
      console.error(error);
      res.status(500).send("Internal Server Error");
    });
});

app.listen(3001, () => {
  console.log("Second Container listening on port 3001");
});
