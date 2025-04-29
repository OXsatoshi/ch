const db = require("../db"); // Import the db configuration

module.exports = {
  getAllArmes: async (req, res) => {
    try {
      const result = await db.query("SELECT * FROM arme");
      res.json(result.rows);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
  },

  // Create a new arme
  createArme: async (req, res) => {
    const { nom, arab_abbreviation, frch_abbreviation } = req.body;
    try {
      const result = await db.query(
        "INSERT INTO arme (nom, arab_abbreviation, frch_abbreviation) VALUES ($1, $2, $3) RETURNING *",
        [nom, arab_abbreviation, frch_abbreviation],
      );
      res.json(result.rows[0]);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
  },
};
