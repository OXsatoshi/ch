const express = require("express");
const router = express.Router();
const specialiteController = require("../controllers/specialite.controller");

// Get all specialites
router.get("/", specialiteController.getAllSpecialites);

// Get a single specialite by ID
//router.get("/:id", specialiteController.getSpecialiteById);

// Create a new specialite
router.post("/", specialiteController.createSpecialite);

// Update a specialite by ID
//router.put("/:id", specialiteController.updateSpecialite);

// Delete a specialite by ID
//router.delete("/:id", specialiteController.deleteSpecialite);

module.exports = router;
