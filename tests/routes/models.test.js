const request = require('supertest');
const app = require('../../src/app');
const { updateModelDb, getModelDb } = require('../../src/data/models');
const { modelsExample } = require('../fixtures/modelsData');

jest.mock('../../src/data/models');

describe('Test in models routes', () => {
  const brandRoute = '/api/models';
  afterEach(() => {
    jest.clearAllMocks();
  });

  describe('PUT /:id', () => {
    test('should update model', async () => {
      updateModelDb.mockReturnValueOnce({ affectedRows: 1 });
      const { statusCode, body } = await request(app)
        .put(`${brandRoute}/1`)
        .send({ average_price: 1000 });
      expect(statusCode).toBe(200);
      expect(body).toEqual({ msg: 'Model updated successfully' });
    });

    test('should return an error when model does not exist', async () => {
      updateModelDb.mockReturnValueOnce({ affectedRows: 0 });
      const { statusCode, body } = await request(app)
        .put(`${brandRoute}/1`)
        .send({ average_price: 1000 });
      expect(statusCode).toBe(404);
      expect(body).toEqual({ msg: 'Model not found' });
    });
  });

  describe('GET /', () => {
    test('should get all models', async () => {
      getModelDb.mockReturnValueOnce(modelsExample);
      const { statusCode, body } = await request(app).get(`${brandRoute}/`);
      expect(statusCode).toBe(200);
      expect(body).toEqual(modelsExample);
    });
  });
});
