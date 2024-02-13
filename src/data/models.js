const pool = require('../db/config');

const updateModelDb = async (averagePrice, modelId) => {
  const query = 'UPDATE model SET average_price = ? WHERE id = ?';
  return await pool.query(query, [averagePrice, modelId]);
};

const getModelDb = async (greater, lower) => {
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

  return await pool.query(query, params);
};

module.exports = { updateModelDb, getModelDb };
