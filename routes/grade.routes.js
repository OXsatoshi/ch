const express = require("express");
const router = express.Router();
const gradeController = require("../controllers/grade.controller");

// Get all grades
router.get("/", gradeController.getAllGrades);

// Get a single grade by ID
//router.get("/:id", gradeController.getGradeById);

// Create a new grade
router.post("/", gradeController.createGrade);

// Update a grade by ID
//router.put("/:id", gradeController.updateGrade);

// Delete a grade by ID
//router.delete("/:id", gradeController.deleteGrade);

module.exports = router;
