const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();

app.use(cors());
app.use(express.json());

app.use('/api/brands', require('./routes/brands'));
app.use('/api/models', require('./routes/models'));

module.exports = app;
