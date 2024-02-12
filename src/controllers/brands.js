const { response } = require('express');
const util = require('util');
const { connection } = require('../db/config');

const dbQuery = util.promisify(connection.query).bind(connection);

const getBrands = async (req, res = response) => {
  const query =
    'SELECT b.id, b.name, COALESCE(ROUND(AVG(m.average_price)), 0) AS average_price FROM brand b LEFT JOIN model m ON b.id = m.brand_id GROUP BY b.id, b.name ORDER BY b.id';

  try {
    // Get brands
    const resp = await dbQuery(query);
    return res.status(200).json(resp);
  } catch (error) {
    return res.status(500).json({ msg: 'Something went wrong' });
  }
};

const getModelsByBrandId = async (req, res = response) => {
  const brandId = req.params.id;
  const query = 'SELECT id, name, average_price FROM model WHERE brand_id=?';

  try {
    // Get models by brandId
    const models = await dbQuery(query, [brandId]);

    // Check if brand does not exist
    if (models.length === 0) {
      return res.status(404).json({ msg: 'Brand not found' });
    }
    return res.status(200).json(models);
  } catch (error) {
    return res.status(500).json({ msg: 'Something went wrong' });
  }
};

const addBrand = async (req, res = response) => {
  const { name } = req.body;
  let query = 'SELECT COUNT(*) AS count FROM brand WHERE name=?';

  try {
    // Check if brand already exist
    const results = await dbQuery(query, [name]);
    if (results[0].count > 0) {
      return res.status(409).json({ msg: 'Brand already exist' });
    }

    // Add brand
    query = 'INSERT INTO brand (name) VALUES (?)';
    await dbQuery(query, [name]);
    return res.status(201).json({ msg: 'Brand added successfully' });
  } catch (error) {
    return res.status(500).json({ msg: 'Something went wrong' });
  }
};

const addModelByBrandId = async (req, res = response) => {
  const brandId = req.params.id;
  const { name, average_price: averagePrice } = req.body;

  // Validate average price exist
  if (averagePrice && averagePrice < 100000) {
    return res
      .status(400)
      .json({ msg: 'Average price must be greater than 100,000.' });
  }

  let query = 'SELECT COUNT(*) AS count FROM brand WHERE id=?';

  try {
    // Check if brand does not exist
    const brandsResult = await dbQuery(query, [brandId]);
    if (brandsResult[0].count === 0) {
      return res.status(404).json({ msg: 'Brand not found' });
    }

    // Check if model already exist
    query = 'SELECT COUNT(*) AS count FROM model WHERE name=?';
    const modelsResult = await dbQuery(query, [name]);
    if (modelsResult[0].count > 0) {
      return res.status(409).json({ msg: 'Model already exist' });
    }

    // Add model by brandId
    query =
      'INSERT INTO model (name, average_price, brand_id) VALUES (?, ?, ?)';
    await dbQuery(query, [name, averagePrice || 0, brandId]);
    return res.status(201).json({ msg: 'Model added successfully' });
  } catch (error) {
    return res.status(500).json({ msg: 'Something went wrong' });
  }
};

module.exports = {
  getBrands,
  getModelsByBrandId,
  addBrand,
  addModelByBrandId
};
