const { Pool } = require("pg");
require("dotenv").config();

const pool = new Pool({
  host: "localhost",
  user: "nabil",
  password: "ba062358",
  database: "pfe_sdm",
});
pool
  .query("SELECT current_database(), current_schema();")
  .then((res) => console.log("✅ Connected to database:", res.rows[0]))
  .catch((err) => console.error("❌ Database connection error:", err));
console.log(process.env.DB_NAME);
// Export a query function to use everywhere
module.exports = {
  query: (text, params) => pool.query(text, params),
};
