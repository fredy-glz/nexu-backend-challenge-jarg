const util = require('util');
const { connection } = require('../db/config');
const { response } = require('express');

const dbQuery = util.promisify(connection.query).bind(connection);

const updateModel = async (req, res = response) => {
  const modelId = req.params.id;
  const { average_price: averagePrice } = req.body;

  const query = 'UPDATE model SET average_price = ? WHERE id = ?';
  try {
    // Check if model does not exist
    const results = await dbQuery(query, [averagePrice, modelId]);
    if (results.affectedRows === 0) {
      return res.status(404).json({ msg: 'Model not found' });
    }

    // Update model
    return res.status(200).json({ msg: 'Model updated successfully' });
  } catch (error) {
    return res.status(500).json({ msg: 'Something went wrong' });
  }
};

const getModels = async (req, res = response) => {
  const { greater, lower } = req.query;
  let query = 'SELECT id, name, average_price FROM model WHERE 1=1';
  const params = [];

  // Add filters
  if (greater) {
    query += ' AND average_price > ?';
    params.push(parseInt(greater));
  }
  if (lower) {
    query += ' AND average_price < ?';
    params.push(parseInt(lower));
  }

  try {
    // Get models
    const resp = await dbQuery(query, params);
    return res.status(200).json(resp);
  } catch (error) {
    return res.status(500).json({ msg: 'Something went wrong' });
  }
};

module.exports = {
  updateModel,
  getModels
};
