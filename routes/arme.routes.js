const express = require("express");
const router = express.Router();
const armeController = require("../controllers/arme.controller.js");
// Get all armes
router.get("/", armeController.getAllArmes);

//router.get("/:id", armeController.getArmeById);

// Create a new arme
router.post("/", armeController.createArme);

//router.put("/:id", armeController.updateArme);

// Delete an arme by ID
//router.delete("/:id", armeController.deleteArme);

module.exports = router;
