const { Client } = require("pg");
const client = new Client({
  host: "localhost",
  user: "postgres",
  port: 5432,
  password: "73864!",
  database: "bookSharing",
});

module.exports = client;
