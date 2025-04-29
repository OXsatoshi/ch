const db = require("../db/db.js"); // Import the db configuration
module.exports = {
  // Get all grades
  getAllGrades: async (req, res) => {
    try {
      const result = await db.query("SELECT * FROM grade");
      res.json(result.rows);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
  },

  // Create a new grade
  createGrade: async (req, res) => {
    const { ar_label, fr_label, name } = req.body;
    try {
      const result = await db.query(
        "INSERT INTO grade (ar_label, fr_label, name) VALUES ($1, $2, $3) RETURNING *",
        [ar_label, fr_label, name],
      );
      res.json(result.rows[0]);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
  },
};
