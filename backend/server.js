require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const multer = require('multer');
const upload = multer();

const productRoute = require('./routes/api/productRoute');

// Ensure MONGO_URL is set
const MONGODB_URI = process.env.MONGO_URL;
if (!MONGODB_URI) {
    console.error("Error: MONGO_URL environment variable not set");
    process.exit(1);
}

// Connect to MongoDB using async/await
// Connect to MongoDB Atlas
mongoose.connect(MONGODB_URI)
    .then(() => console.log('Database connected successfully'))
    .catch(err => {
        console.error('Database connection error:', err);
        process.exit(1);
    });


connectDB();

// Initialize Express app
const app = express();

// Middleware
app.use(express.json());   // Body parser
app.use(upload.array());   // Multer for multipart/form-data
app.use(cors());           // Enable CORS

// Routes
app.use('/api/products', productRoute);

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}`);
});
