const express = require("express");
const router = express.Router();
const fonctionController = require("../controllers/fonction.controller");

// Get all fonctions
router.get("/", fonctionController.getAllFonctions);

// Get a single fonction by ID
//router.get("/:id", fonctionController.getFonctionById);

// Create a new fonction
router.post("/", fonctionController.createFonction);

// Update a fonction by ID
//router.put("/:id", fonctionController.updateFonction);

// Delete a fonction by ID
//router.delete("/:id", fonctionController.deleteFonction);

module.exports = router;
