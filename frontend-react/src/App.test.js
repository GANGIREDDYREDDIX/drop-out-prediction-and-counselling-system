import { render, screen } from '@testing-library/react';
import axios from 'axios';
import App from './App';

jest.mock('axios');

test('renders app header', async () => {
  axios.get.mockResolvedValue({ data: [] });
  render(<App />);
  const header = await screen.findByText(/AI-Based Student Dropout Prediction System/i);
  expect(header).toBeInTheDocument();
});
