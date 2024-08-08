// HomePage.test.js
import React from 'react';
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import { BrowserRouter as Router } from 'react-router-dom';
import HomePage from '../components/Home'; // Adjust the import path as needed
import { useRecipeContext } from '../state';
import { sendRequest } from '../api';

jest.mock('../api', () => ({
	sendRequest: jest.fn(),
}));

jest.mock('../state', () => ({
	useRecipeContext: jest.fn(),
}));

const mockDispatch = jest.fn();
const mockState = { categories: [{ name: 'Appetizers' }, { name: 'Desserts' }] };

beforeEach(() => {
	useRecipeContext.mockReturnValue({ state: mockState, dispatch: mockDispatch });
	sendRequest.mockResolvedValue([{ name: 'Appetizers' }, { name: 'Desserts' }]);
});

afterEach(() => {
	jest.clearAllMocks();
});

test('renders the HomePage component', async () => {
	render(
		<Router>
			<HomePage />
		</Router>
	);

	expect(screen.getByText('Food Recipes')).toBeInTheDocument();
	expect(screen.getByText('A curated list of recipes for the best homemade meal and delicacies.')).toBeInTheDocument();

	await waitFor(() => {
		expect(screen.getByText('Appetizers')).toBeInTheDocument();
		expect(screen.getByText('Desserts')).toBeInTheDocument();
	});

	// Check for "More categories" link
	expect(screen.getByRole('link', { name: /More categories/i })).toBeInTheDocument();
});

test('submits the search form and navigates', () => {
	const navigate = jest.fn();
	jest.mock('react-router-dom', () => ({
		...jest.requireActual('react-router-dom'),
		useNavigate: () => navigate,
	}));

	render(
		<Router>
			<HomePage />
		</Router>
	);

	// Simulate user input and form submission
	fireEvent.change(screen.getByRole('textbox'), { target: { value: 'Pasta' } });
	fireEvent.submit(screen.getByRole('form'));

	// Check if navigation occurs with the correct URL
	expect(navigate).toHaveBeenCalledWith('/search?q=Pasta');
});

