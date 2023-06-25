const axios = require("axios");

axios
  .get("http://second-container/hello-world")
  .then((response) => {
    console.log(response.data);
  })
  .catch((error) => {
    console.error(error);
  });
