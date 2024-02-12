const express = require('express');
const cors = require('cors');
require('dotenv').config();
// eslint-disable-next-line no-unused-vars
const { connection } = require('./db/config');

const app = express();

app.use(cors());
app.use(express.json());

app.use('/api/brands', require('./routes/brands'));
app.use('/api/models', require('./routes/models'));

app.listen(process.env.PORT, () =>
  console.log(`Server on port ${process.env.PORT}`)
);
