const express = require('express');
const { updateModel, getModels } = require('../controllers/models');
const router = express.Router();

router.put('/:id', updateModel);
router.get('/', getModels);

module.exports = router;
