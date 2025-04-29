const db = require("../db/db.js"); // Import the db configuration

module.exports = {
  // Get all fonctions
  getAllFonctions: async (req, res) => {
    try {
      const result = await db.query("SELECT * FROM fonction");
      res.json(result.rows);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
  },

  // Create a new fonction
  createFonction: async (req, res) => {
    const { name } = req.body;
    try {
      const result = await db.query(
        "INSERT INTO fonction (name) VALUES ($1) RETURNING *",
        [name],
      );
      res.json(result.rows[0]);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
  },
};
