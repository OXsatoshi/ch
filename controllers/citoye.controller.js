const db = require("../db/db.js"); // Import the db configuration
module.exports = {
  // Get all citoyens
  getAllCitoyens: async (req, res) => {
    const citoyeQuery = `
SELECT 
  c.id AS citoyen_id,
  c.nom,
  c.prenom,
  c.address,
  c.birthdate,
  a.nom AS arme,
  g.fr_label AS grade,
  f.name AS fonction,
  s.name AS specialite,
  sf.is_married AS situation_familiale,
  c.is_validated
FROM 
  citoyen c
LEFT JOIN arme a ON c.arme_id = a.id
LEFT JOIN grade g ON c.grade_id = g.id
LEFT JOIN fonction f ON c.fonction_id = f.id
LEFT JOIN specialite s ON c.specialite_id = s.id
LEFT JOIN situation_familiale sf ON c.situation_familiale_id = sf.id;
`;
    try {
      const result = await db.query(citoyeQuery);
      res.json(result.rows);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
  },

  // Create a new citoyen
  createCitoyen: async (req, res) => {
    const {
      nom,
      prenom,
      address,
      birthdate,
      arme_id,
      grade_id,
      fonction_id,
      specialite_id,
      situation_familiale_id,
      is_validated,
    } = req.body;
    try {
      const result = await db.query(
        "INSERT INTO citoyen (nom, prenom, address, birthdate, arme_id, grade_id, fonction_id, specialite_id, situation_familiale_id, is_validated) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING *",
        [
          nom,
          prenom,
          address,
          birthdate,
          arme_id,
          grade_id,
          fonction_id,
          specialite_id,
          situation_familiale_id,
          is_validated,
        ],
      );
      res.json(result.rows[0]);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
  },
};
