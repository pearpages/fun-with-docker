const axios = require("axios");
const nodeEnv = process.env.NODE_ENV || "development";

axios
  .get(
    `http://${
      nodeEnv === "production" ? "second-container" : "127.0.0.1"
    }:3001/hello-world`
  )
  .then((response) => {
    console.log(response.data);
  })
  .catch((error) => {
    console.error(error);
  });
