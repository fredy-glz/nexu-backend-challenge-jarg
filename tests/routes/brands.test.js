const request = require('supertest');
const app = require('../../src/app');
const {
  getBrandsDb,
  getModelsByBrandIdDb,
  addBrandDb,
  validateExistModelByNameDb,
  validateExistBrandByIdDb,
  addModelDb,
  validateExistBrandByNameDb,
} = require('../../src/data/brands');
const {
  brandsExample,
  modelsByBrandIdExample,
  newBrand,
  newModel,
} = require('../fixtures/brandsData');

jest.mock('../../src/data/brands');

describe('Test in brands routes', () => {
  const brandRoute = '/api/brands';
  afterEach(() => {
    jest.clearAllMocks();
  });

  describe('GET /', () => {
    test('should get all brands', async () => {
      getBrandsDb.mockReturnValueOnce(brandsExample);
      const { statusCode, body } = await request(app)
        .get(`${brandRoute}/`)
        .send();
      expect(statusCode).toBe(200);
      expect(body).toEqual(brandsExample);
    });

    test('should return an status 500 when there is an error', async () => {
      getBrandsDb.mockImplementationOnce(new Error('something went wrong'));
      const { statusCode, body } = await request(app)
        .get(`${brandRoute}/`)
        .send();
      expect(statusCode).toBe(500);
      expect(body).toEqual({ msg: 'Something went wrong' });
    });
  });

  describe('GET /:id/models', () => {
    test('should return all models by brand id', async () => {
      getModelsByBrandIdDb.mockReturnValueOnce(modelsByBrandIdExample);
      const { statusCode, body } = await request(app)
        .get(`${brandRoute}/1/models`)
        .send();
      expect(statusCode).toBe(200);
      expect(body).toEqual(modelsByBrandIdExample);
    });

    test('should return an error when brand id does not exist', async () => {
      getModelsByBrandIdDb.mockReturnValueOnce([]);
      const { statusCode, body } = await request(app)
        .get(`${brandRoute}/0/models`)
        .send();
      expect(statusCode).toBe(404);
      expect(body).toEqual({ msg: 'Brand not found' });
    });

    test('should return an status 500 when there is an error', async () => {
      getModelsByBrandIdDb.mockImplementationOnce(
        new Error('something went wrong'),
      );
      const { statusCode, body } = await request(app)
        .get(`${brandRoute}/0/models`)
        .send();
      expect(statusCode).toBe(500);
      expect(body).toEqual({ msg: 'Something went wrong' });
    });
  });

  describe('POST /', () => {
    test('should register a brand', async () => {
      validateExistBrandByNameDb.mockReturnValueOnce([{ count: 0 }]);
      addBrandDb.mockReturnValueOnce({});
      const { statusCode, body } = await request(app)
        .post(`${brandRoute}/`)
        .send(newBrand);
      expect(statusCode).toBe(201);
      expect(body).toEqual({ msg: 'Brand added successfully' });
    });

    test('should return an eror when brand already exist', async () => {
      validateExistBrandByNameDb.mockReturnValueOnce([{ count: 1 }]);
      addBrandDb.mockReturnValueOnce({});
      const { statusCode, body } = await request(app)
        .post(`${brandRoute}/`)
        .send(newBrand);
      expect(statusCode).toBe(409);
      expect(body).toEqual({ msg: 'Brand already exist' });
    });

    test('should return an status 500 when there is an error', async () => {
      addBrandDb.mockImplementationOnce(new Error('something went wrong'));
      const { statusCode, body } = await request(app)
        .post(`${brandRoute}/`)
        .send(newBrand);
      expect(statusCode).toBe(500);
      expect(body).toEqual({ msg: 'Something went wrong' });
    });
  });

  describe('POST /:id/models', () => {
    test('should add a model', async () => {
      validateExistBrandByIdDb.mockReturnValueOnce([{ count: 1 }]);
      validateExistModelByNameDb.mockReturnValueOnce([{ count: 0 }]);
      addModelDb.mockReturnValueOnce({});
      const { statusCode, body } = await request(app)
        .post(`${brandRoute}/1/models`)
        .send(newModel);
      expect(statusCode).toBe(201);
      expect(body).toEqual({ msg: 'Model added successfully' });
    });

    test('should return an error when brand does not exist', async () => {
      validateExistBrandByIdDb.mockImplementationOnce(() => {
        return [{ count: 0 }];
      });
      const { statusCode, body } = await request(app)
        .post(`${brandRoute}/1/models`)
        .send(newModel);
      expect(statusCode).toBe(404);
      expect(body).toEqual({ msg: 'Brand not found' });
    });

    test('should return an error when model already exist', async () => {
      validateExistBrandByIdDb.mockReturnValueOnce([{ count: 1 }]);
      validateExistModelByNameDb.mockReturnValueOnce([{ count: 1 }]);
      const { statusCode, body } = await request(app)
        .post(`${brandRoute}/1/models`)
        .send(newModel);
      expect(statusCode).toBe(409);
      expect(body).toEqual({ msg: 'Model already exist' });
    });
  });
});
