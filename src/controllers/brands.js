const { response } = require('express');
const {
  getBrandsDb,
  getModelsByBrandIdDb,
  addBrandDb,
  validateExistModelByNameDb,
  addModelDb,
  validateExistBrandByIdDb,
  validateExistBrandByNameDb,
} = require('../data/brands');

const getBrands = async (req, res = response) => {
  try {
    // Get brands
    const resp = await getBrandsDb();
    return res.status(200).json(resp);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ msg: 'Something went wrong' });
  }
};

const getModelsByBrandId = async (req, res = response) => {
  const brandId = req.params.id;

  try {
    // Get models by brandId
    const models = await getModelsByBrandIdDb(brandId);

    // Check if brand does not exist
    if (models.length === 0) {
      return res.status(404).json({ msg: 'Brand not found' });
    }
    return res.status(200).json(models);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ msg: 'Something went wrong' });
  }
};

const addBrand = async (req, res = response) => {
  const { name } = req.body;

  try {
    // Check if brand already exist
    const results = await validateExistBrandByNameDb(name);
    if (results[0].count > 0) {
      return res.status(409).json({ msg: 'Brand already exist' });
    }

    // Add brand
    await addBrandDb(name);
    return res.status(201).json({ msg: 'Brand added successfully' });
  } catch (error) {
    console.log(error);
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

  try {
    // Check if brand does not exist
    const brandsResult = await validateExistBrandByIdDb(brandId);
    if (brandsResult[0].count === 0) {
      return res.status(404).json({ msg: 'Brand not found' });
    }

    // Check if model already exist¿
    const modelsResult = await validateExistModelByNameDb(name);
    if (modelsResult[0].count > 0) {
      return res.status(409).json({ msg: 'Model already exist' });
    }

    // Add model by brandId
    await addModelDb(name, averagePrice || 0, brandId);
    return res.status(201).json({ msg: 'Model added successfully' });
  } catch (error) {
    console.log(error);
    return res.status(500).json({ msg: 'Something went wrong' });
  }
};

module.exports = {
  getBrands,
  getModelsByBrandId,
  addBrand,
  addModelByBrandId,
};
