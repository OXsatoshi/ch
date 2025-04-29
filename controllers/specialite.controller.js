const db = require("../db/db.js"); // Import the db configuration
module.exports = {
  // Get all specialites
  getAllSpecialites: async (req, res) => {
    try {
      const result = await db.query("SELECT * FROM specialite");
      res.json(result.rows);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
  },

  // Create a new specialite
  createSpecialite: async (req, res) => {
    const { name, diploma } = req.body;
    try {
      const result = await db.query(
        "INSERT INTO specialite (name, diploma) VALUES ($1, $2) RETURNING *",
        [name, diploma],
      );
      res.json(result.rows[0]);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
  },
};
