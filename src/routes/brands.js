const express = require('express');
const {
  getModelsByBrandId,
  addBrand,
  addModelByBrandId,
  getBrands,
} = require('../controllers/brands');

const router = express.Router();

router.get('/', getBrands);
router.get('/:id/models', getModelsByBrandId);
router.post('/', addBrand);
router.post('/:id/models', addModelByBrandId);

module.exports = router;
