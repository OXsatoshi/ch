const db = require("../db/db.js"); // Import the db configuration
module.exports = {
  // Get all situations familiales
  getAllSituationsFamiliales: async (req, res) => {
    try {
      const result = await db.query("SELECT * FROM situation_familiale");
      res.json(result.rows);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
  },

  // Create a new situation familiale
  createSituationFamiliale: async (req, res) => {
    const { is_married, number_of_kids, spouse_name, marriage_date } = req.body;
    try {
      const result = await db.query(
        "INSERT INTO situation_familiale (is_married, number_of_kids, spouse_name, marriage_date) VALUES ($1, $2, $3, $4) RETURNING *",
        [is_married, number_of_kids, spouse_name, marriage_date],
      );
      res.json(result.rows[0]);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
  },
};
