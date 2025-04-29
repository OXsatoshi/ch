const express = require("express");
const router = express.Router();
const situationFamilialeController = require("../controllers/situation.controller.js");

// Get all situation familiales
router.get("/", situationFamilialeController.getAllSituationsFamiliales);

// Get a single situation familiale by ID
//router.get("/:id", situationFamilialeController.getSituationFamilialeById);

// Create a new situation familiale
router.post("/", situationFamilialeController.createSituationFamiliale);

// Update a situation familiale by ID
//router.put("/:id", situationFamilialeController.updateSituationFamiliale);

// Delete a situation familiale by ID
//router.delete("/:id", situationFamilialeController.deleteSituationFamiliale);

module.exports = router;
