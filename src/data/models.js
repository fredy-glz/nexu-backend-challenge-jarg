// const pool = require('../db/config');
const util = require('util');
const { connection } = require('../db/config');

const dbQuery = util.promisify(connection.query).bind(connection);

const updateModelDb = async (averagePrice, modelId) => {
  const query = 'UPDATE model SET average_price = ? WHERE id = ?';
  return await dbQuery(query, [averagePrice, modelId]);
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

  return await dbQuery(query, params);
};

module.exports = { updateModelDb, getModelDb };
