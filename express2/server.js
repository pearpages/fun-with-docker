const express = require("express");

const app = express();

app.get("/user", (req, res) => {
  const user = {
    name: "John Doe",
    age: 25,
    email: "john.doe@example.com",
  };

  res.json(user);
});

app.listen(3000, () => {
  console.log("Third Container listening on port 3000");
});
