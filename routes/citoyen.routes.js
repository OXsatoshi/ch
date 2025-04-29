const express = require("express");
const router = express.Router();
const citoyenController = require("../controllers/citoye.controller.js");

// Get all citoyens
router.get("/", citoyenController.getAllCitoyens);

// Get a single citoyen by ID
//router.get("/:id", citoyenController.getCitoyenById);

// Create a new citoyen
router.post("/", citoyenController.createCitoyen);

// Update a citoyen by ID
//router.put("/:id", citoyenController.updateCitoyen);

// Delete a citoyen by ID
//router.delete("/:id", citoyenController.deleteCitoyen);

module.exports = router;
