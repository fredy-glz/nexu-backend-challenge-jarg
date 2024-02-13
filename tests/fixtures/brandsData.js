const brandsExample = [
  { id: 1, nombre: 'Acura', average_price: 702109 },
  { id: 2, nombre: 'Audi', average_price: 630759 },
  { id: 3, nombre: 'Bentley', average_price: 3342575 },
  { id: 4, nombre: 'BMW', average_price: 858702 },
  { id: 5, nombre: 'Buick', average_price: 290371 },
];

const modelsByBrandIdExample = [
  { id: 1, name: 'ILX', average_price: 303176 },
  { id: 2, name: 'MDX', average_price: 448193 },
  { id: 1264, name: 'NSX', average_price: 3818225 },
  { id: 3, name: 'RDX', average_price: 395753 },
  { id: 354, name: 'RL', average_price: 239050 },
];

const newBrand = { name: 'test brand' };

const newModel = {
  name: 'A50',
  average_price: 100000,
};

module.exports = {
  brandsExample,
  modelsByBrandIdExample,
  newBrand,
  newModel,
};
