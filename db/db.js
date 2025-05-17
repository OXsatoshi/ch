const { Pool } = require("pg");

const pool = new Pool({
  connectionString: "postgresql://postgres:password@db:5432/mydb",
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
