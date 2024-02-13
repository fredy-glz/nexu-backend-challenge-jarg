const { response } = require('express');
const { updateModelDb, getModelDb } = require('../data/models');

const updateModel = async (req, res = response) => {
  const modelId = req.params.id;
  const { average_price: averagePrice } = req.body;

  try {
    // Check if model does not exist
    const results = await updateModelDb(averagePrice, modelId);
    if (results.affectedRows === 0) {
      return res.status(404).json({ msg: 'Model not found' });
    }

    // Update model
    return res.status(200).json({ msg: 'Model updated successfully' });
  } catch (error) {
    console.log(error);
    return res.status(500).json({ msg: 'Something went wrong' });
  }
};

const getModels = async (req, res = response) => {
  const { greater, lower } = req.query;

  try {
    // Get models
    const models = await getModelDb(greater, lower);
    return res.status(200).json(models);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ msg: 'Something went wrong' });
  }
};

module.exports = {
  updateModel,
  getModels,
};
