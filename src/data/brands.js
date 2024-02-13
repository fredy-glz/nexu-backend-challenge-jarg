// const util = require('util');
// const { connection } = require('../db/config');

// const dbQuery = util.promisify(connection.query).bind(connection);

const pool = require('../db/config');

const getBrandsDb = async () => {
  const query =
    'SELECT b.id, b.name, COALESCE(ROUND(AVG(m.average_price)), 0) AS average_price FROM brand b LEFT JOIN model m ON b.id = m.brand_id GROUP BY b.id, b.name ORDER BY b.id';

  const resp = await pool.query(query);
  return resp;
};

const getModelsByBrandIdDb = async (brandId) => {
  const query = 'SELECT id, name, average_price FROM model WHERE brand_id=?';
  const resp = await pool.query(query, [brandId]);
  return resp;
};

const validateExistBrandByNameDb = async (name) => {
  const query = 'SELECT COUNT(*) AS count FROM brand WHERE name=?';
  return pool.query(query, [name]);
};

const validateExistBrandByIdDb = async (id) => {
  const query = 'SELECT COUNT(*) AS count FROM brand WHERE id=?';
  return pool.query(query, [id]);
};

const validateExistModelByNameDb = async (name) => {
  const query = 'SELECT COUNT(*) AS count FROM model WHERE name=?';
  return pool.query(query, [name]);
};

const addBrandDb = async (name) => {
  const query = 'INSERT INTO brand (name) VALUES (?)';
  await pool.query(query, [name]);
};

const addModelDb = async (name, averagePrice, brandId) => {
  const query =
    'INSERT INTO model (name, average_price, brand_id) VALUES (?, ?, ?)';
  await pool.query(query, [name, averagePrice, brandId]);
};

module.exports = {
  getBrandsDb,
  getModelsByBrandIdDb,
  validateExistBrandByNameDb,
  validateExistBrandByIdDb,
  validateExistModelByNameDb,
  addBrandDb,
  addModelDb,
};
