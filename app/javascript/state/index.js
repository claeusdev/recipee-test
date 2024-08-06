import React, { createContext, useContext, useReducer } from 'react';

const RecipesContext = createContext();

const reducer = (state, { type, payload }) => {
	switch (type) {
		case 'SET_RECIPES':
			return {
				...state,
				recipies: payload.recipies
			};
		case 'SET_CATEGORIES':
			return {
				...state,
				categories: payload.categories
			};
		default:
			return state;
	}
};


export const useRecipeContext = () => useContext(RecipesContext);

export const RecipesProvider = ({ children }) => {
	const [state, dispatch] = useReducer(reducer, {
		recipes: [],
		categories: [],
		currentCategory: {}
	})

	return (
		<RecipesContext.Provider value={{ state, dispatch }}>
			{children}
		</RecipesContext.Provider>
	);
};

