const express = require("express");
const app = express();
const cors = require("cors");
const bodyParser = require("body-parser");

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Import routes
const armeRoutes = require("./routes/arme.routes");
const gradeRoutes = require("./routes/grade.routes");
const fonctionRoutes = require("./routes/fonction.routes");
const specialiteRoutes = require("./routes/specialite.routes");
const situationFamilialeRoutes = require("./routes/ssituation_familiale.routes.js");
const citoyenRoutes = require("./routes/citoyen.routes");

// Use routes
app.use("/api/armes", armeRoutes);
app.use("/api/grades", gradeRoutes);
app.use("/api/fonctions", fonctionRoutes);
app.use("/api/specialites", specialiteRoutes);
app.use("/api/situationfamiliales", situationFamilialeRoutes);
app.use("/api/citoyens", citoyenRoutes);

// Error handling middleware
app.use((req, res) => {
  res.status(404).json({ message: "Not Found" });
});

app.listen(3000, () => {
  console.log("Server is running on port 3000");
});
